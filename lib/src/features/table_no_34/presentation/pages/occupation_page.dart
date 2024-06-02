import 'package:digital_profile/src/features/table_no_34/data/repository/occupation_repository_impl.dart';
import 'package:digital_profile/src/features/table_no_34/presentation/widgets/occupation_bar_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/model/occupation_model.dart';
import '../bloc/occupation_bloc.dart';

class OccupationPage extends StatefulWidget {
  String baseUrl, endPoint;

  OccupationPage(this.baseUrl, this.endPoint, {super.key});

  @override
  State<OccupationPage> createState() => _OccupationPageState();
}

class _OccupationPageState extends State<OccupationPage> {
  int totalAgriculture = 0;
  int totalOffice = 0;
  int totalBusiness = 0;
  int totalWorker = 0;
  int totalEntrepreneur = 0;
  int totalForeignEmp = 0;
  int totalStudent = 0;
  int totalHousewife = 0;
  int totalUnemployed = 0;
  int totalUnderage = 0;
  int totalPension = 0;
  int totalTechnical = 0;
  int totalSenior = 0;
  int totalOthers = 0;
  int totalNotAvailable = 0;
  int totalOccupation = 0;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OccupationBloc(
          RepositoryProvider.of<ImplOccupationRepository>(context),
          widget.baseUrl,
          widget.endPoint)
        ..add(GetOccupationEvent()),
      child: BlocBuilder<OccupationBloc, OccupationState>(
        builder: (context, state) {
          if (state is OccupationSuccessState) {
            List<OccupationModel> fetchedData = state.fetchedModel;

            fetchedData.asMap().forEach((key, value) {
              totalAgriculture += fetchedData[key].agriculture ?? 0;
              totalOffice += fetchedData[key].office ?? 0;
              totalBusiness += fetchedData[key].business ?? 0;
              totalWorker += fetchedData[key].worker ?? 0;
              totalEntrepreneur += fetchedData[key].entrepreneur ?? 0;
              totalForeignEmp += fetchedData[key].foreignEmp ?? 0;
              totalStudent += fetchedData[key].student ?? 0;
              totalHousewife += fetchedData[key].houseWife ?? 0;
              totalUnemployed += fetchedData[key].unemployed ?? 0;
              totalUnderage += fetchedData[key].underage ?? 0;
              totalPension += fetchedData[key].pension ?? 0;
              totalTechnical += fetchedData[key].technical ?? 0;
              totalSenior += fetchedData[key].seniorCtzn ?? 0;
              totalOthers += fetchedData[key].others ?? 0;
              totalNotAvailable += fetchedData[key].notAvailable ?? 0;
              totalOccupation += fetchedData[key].total ?? 0;
            });
          }
          return Column(
            children: [
              OccupationBarChart(
                  totalAgriculture,
                  totalOffice,
                  totalBusiness,
                  totalWorker,
                  totalEntrepreneur,
                  totalForeignEmp,
                  totalStudent,
                  totalHousewife,
                  totalUnemployed,
                  totalUnderage,
                  totalPension,
                  totalTechnical,
                  totalSenior,
                  totalOthers,
                  totalNotAvailable,
                  totalOccupation),
            ],
          );
        },
      ),
    );
  }
}
