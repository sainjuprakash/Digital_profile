import 'package:digital_profile/constant/spacing.dart';
import 'package:digital_profile/src/features/table_no_109/data/model/loan_model.dart';
import 'package:digital_profile/src/features/table_no_109/data/repository/loan_repository_impl.dart';
import 'package:digital_profile/src/features/table_no_109/presentation/widgets/loan_bar_chart.dart';
import 'package:digital_profile/src/features/table_no_109/presentation/widgets/loan_data_table.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/loan_bloc.dart';

class LoanPage extends StatefulWidget {
  String baseUrl, endPoint;
  LoanPage(this.baseUrl, this.endPoint, {super.key});

  @override
  State<LoanPage> createState() => _LoanPageState();
}

class _LoanPageState extends State<LoanPage> {
  int totalAgriculture = 0;
  int totalBusiness = 0;
  int totalHouseExp = 0;
  int totalForeignEmp = 0;
  int totalEducation = 0;
  int totalMedical = 0;
  int totalOthers = 0;
  int totalNotAvailable = 0;
  int totalWardHouses = 0;
  int totalLoan = 0;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoanBloc(
          RepositoryProvider.of<ImplLoanRepository>(context),
          widget.baseUrl,
          widget.endPoint)
        ..add(GetLoanEvent()),
      child: BlocBuilder<LoanBloc, LoanState>(
        builder: (context, state) {
          if (state is LoanSuccessState) {
            List<LoanModel> fetchedData = state.fetchedModel;
            fetchedData.asMap().forEach((key, value) {
              totalAgriculture += fetchedData[key].agricultureLoan ?? 0;
              totalBusiness += fetchedData[key].businessLoan ?? 0;
              totalHouseExp += fetchedData[key].houseExpLoan ?? 0;
              totalForeignEmp += fetchedData[key].foreignEmpLoan ?? 0;
              totalEducation += fetchedData[key].educationLoan ?? 0;
              totalMedical += fetchedData[key].medicalLoan ?? 0;
              totalOthers += fetchedData[key].othersLoan ?? 0;
              totalNotAvailable += (fetchedData[key].wardHouses ?? 0) -
                  (fetchedData[key].totalLoan ?? 0);
              totalWardHouses += fetchedData[key].wardHouses ?? 0;
              totalLoan += fetchedData[key].totalLoan ?? 0;
            });
          }
          return Column(
            children: [
              LoanBarChart(
                  totalAgriculture,
                  totalBusiness,
                  totalHouseExp,
                  totalForeignEmp,
                  totalEducation,
                  totalMedical,
                  totalOthers,
                  totalNotAvailable,
                  totalWardHouses,
                  totalLoan),
              verticalspace(),
              LoanDataTable(
                  totalAgriculture,
                  totalBusiness,
                  totalHouseExp,
                  totalForeignEmp,
                  totalEducation,
                  totalMedical,
                  totalOthers,
                  totalNotAvailable,
                  totalWardHouses,
                  totalLoan),
            ],
          );
        },
      ),
    );
  }
}
