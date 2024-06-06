import 'package:digital_profile/constant/spacing.dart';
import 'package:digital_profile/src/features/table_no_97/data/repository/road_distance_repository_impl.dart';
import 'package:digital_profile/src/features/table_no_97/presentation/widgets/road_distance_bar_graph.dart';
import 'package:digital_profile/src/features/table_no_97/presentation/widgets/road_distance_data_table.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/model/road_distance_model.dart';
import '../bloc/road_distance_bloc.dart';

class RoadDistancePage extends StatefulWidget {
  String baseUrl, endPoint;

  RoadDistancePage(this.baseUrl, this.endPoint, {super.key});

  @override
  State<RoadDistancePage> createState() => _RoadDistancePageState();
}

class _RoadDistancePageState extends State<RoadDistancePage> {
  int totalLessThanOneHours = 0;
  int totalTwoHours = 0;
  int totalUpToFiveHours = 0;
  int totalMoreThanFive = 0;
  int totalTotal = 0;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RoadDistanceBloc(
          RepositoryProvider.of<ImplRoadDistanceRepository>(context),
          widget.baseUrl,
          widget.endPoint)
        ..add(GetRoadDistanceEvent()),
      child: BlocBuilder<RoadDistanceBloc, RoadDistanceState>(
        builder: (context, state) {
          if (state is RoadDistanceSuccessState) {
            List<RoadDistanceModel> fetchedData = state.fetchedModel;
            fetchedData.asMap().forEach((key, value) {
              totalLessThanOneHours += fetchedData[key].lessThanOneHours ?? 0;
              totalTwoHours += fetchedData[key].twoHours ?? 0;
              totalUpToFiveHours += fetchedData[key].upToFiveHours ?? 0;
              totalMoreThanFive += fetchedData[key].moreThanFive ?? 0;
              totalTotal += fetchedData[key].total ?? 0;
            });
          }
          return Column(
            children: [
              RoadDistanceBarGraph(totalLessThanOneHours, totalTwoHours,
                  totalUpToFiveHours, totalMoreThanFive, totalTotal),
              verticalspace(),
              RoadDistanceDataTable(totalLessThanOneHours, totalTwoHours,
                  totalUpToFiveHours, totalMoreThanFive, totalTotal),
            ],
          );
        },
      ),
    );
  }
}
