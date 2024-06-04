import 'package:digital_profile/constant/spacing.dart';
import 'package:digital_profile/src/features/table_no_65/data/repository/income_repository_impl.dart';
import 'package:digital_profile/src/features/table_no_65/presentation/widgets/income_pie_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/model/income_model.dart';
import '../bloc/income_bloc.dart';

class IncomePage extends StatefulWidget {
  String baseUrl, endPoint;

  IncomePage(this.baseUrl, this.endPoint, {super.key});

  @override
  State<IncomePage> createState() => _IncomePageState();
}

class _IncomePageState extends State<IncomePage> {
  int totalCrops = 0;
  int totalFruits = 0;
  int totalLivestock = 0;
  int totalVegi = 0;
  int totalHerbs = 0;
  int totalLabour = 0;
  int totalBusiness = 0;
  int totalForeignEmp = 0;
  int totalOffice = 0;
  int totalOthers = 0;
  int totalIncome = 0;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => IncomeBloc(
          RepositoryProvider.of<ImplIncomeRepository>(context),
          widget.baseUrl,
          widget.endPoint)
        ..add(GetIncomeEvent()),
      child: BlocBuilder<IncomeBloc, IncomeState>(
        builder: (context, state) {
          if (state is IncomeSuccessState) {
            List<IncomeModel> fetchedData = state.fetchedModel;
            fetchedData.asMap().forEach((key, value) {
              totalCrops += fetchedData[key].crops ?? 0;
              totalFruits += fetchedData[key].fruits ?? 0;
              totalLivestock += fetchedData[key].livestock ?? 0;
              totalVegi += fetchedData[key].vegi ?? 0;
              totalHerbs += fetchedData[key].medi ?? 0;
              totalLabour += fetchedData[key].labour ?? 0;
              totalBusiness += fetchedData[key].business ?? 0;
              totalForeignEmp += fetchedData[key].foreignEmp ?? 0;
              totalOffice += fetchedData[key].office ?? 0;
              totalOthers += fetchedData[key].others ?? 0;
              totalIncome += fetchedData[key].total ?? 0;
            });
          }
          return Column(
            children: [
              IncomePieChart(
                  totalCrops,
                  totalFruits,
                  totalLivestock,
                  totalVegi,
                  totalHerbs,
                  totalLabour,
                  totalBusiness,
                  totalForeignEmp,
                  totalOffice,
                  totalOthers,
                  totalIncome),
              verticalspace(),
            ],
          );
        },
      ),
    );
  }
}
