import 'package:digital_profile/constant/spacing.dart';
import 'package:digital_profile/src/features/marriage/data/repository/marriage_status_repository_impl.dart';
import 'package:digital_profile/src/features/marriage/presentation/widgets/marriage_status_bar_chart.dart';
import 'package:digital_profile/src/features/marriage/presentation/widgets/marriage_status_data_table.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/model/marriage_status_model.dart';
import '../bloc/marriage_status_bloc.dart';
//Table 10
class MarriageStatusPage extends StatefulWidget {
  String baseUrl, endPoints;
  MarriageStatusPage(this.baseUrl, this.endPoints, {super.key});

  @override
  State<MarriageStatusPage> createState() => _MarriageStatusPageState();
}

class _MarriageStatusPageState extends State<MarriageStatusPage> {
  int totalSingleCount = 0;
  int totalMarriedCount = 0;
  int totalSingleWoman = 0;
  int totalSingleManCount = 0;
  int totalPolygami = 0;
  int totalDivorced = 0;
  int totalRemarried = 0;
  int totalSeperated = 0;
  int totalUnderage = 0;
  int totalNotAvailable = 0;
  int totalMaritalStatus = 0;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MarriageStatusBloc(
          RepositoryProvider.of<ImplMarriageRepository>(context),
          widget.baseUrl,
          widget.endPoints)
        ..add(GetMarriageStatusEvent()),
      child: BlocBuilder<MarriageStatusBloc, MarriageStatusState>(
        builder: (context, state) {
          if (state is MarriageSuccessState) {
            List<MarriageStatusModel> fetchedMarriageData = state.marriageModel;
            fetchedMarriageData.asMap().forEach((key, value) {
              totalSingleCount += fetchedMarriageData[key].single ?? 0;
              totalMarriedCount += fetchedMarriageData[key].married ?? 0;
              totalSingleWoman += fetchedMarriageData[key].singleWoman ?? 0;
              totalSingleManCount += fetchedMarriageData[key].singleMana ?? 0;
              totalPolygami += fetchedMarriageData[key].polygami ?? 0;
              totalDivorced += fetchedMarriageData[key].divorced ?? 0;
              totalRemarried += fetchedMarriageData[key].remarried ?? 0;
              totalSeperated += fetchedMarriageData[key].seperated ?? 0;
              totalUnderage += fetchedMarriageData[key].underage ?? 0;
              totalNotAvailable += fetchedMarriageData[key].notAvailable ?? 0;
              totalMaritalStatus +=
                  fetchedMarriageData[key].totalMaritalStatus ?? 0;
            });
          }
          return SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                MarriageBarChart(
                    totalSingleCount: totalSingleCount,
                    totalMarriedCount: totalMarriedCount,
                    totalSingleWoman: totalSingleWoman,
                    totalSingleManCount: totalSingleManCount,
                    totalPolygami: totalPolygami,
                    totalDivorced: totalDivorced,
                    totalRemarried: totalRemarried,
                    totalSeperated: totalSeperated,
                    totalUnderage: totalUnderage,
                    totalNotAvailable: totalNotAvailable,
                    totalMaritalStatus: totalMaritalStatus),
                verticalspace(),
                MarriageDatatable(
                    totalSingleCount: totalSingleCount,
                    totalMarriedCount: totalMarriedCount,
                    totalSingleWoman: totalSingleWoman,
                    totalSingleManCount: totalSingleManCount,
                    totalPolygami: totalPolygami,
                    totalDivorced: totalDivorced,
                    totalRemarried: totalRemarried,
                    totalSeperated: totalSeperated,
                    totalUnderage: totalUnderage,
                    totalNotAvailable: totalNotAvailable,
                    totalMaritalStatus: totalMaritalStatus),
              ],
            ),
          );
        },
      ),
    );
  }
}
