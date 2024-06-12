import 'package:digital_profile/constant/spacing.dart';
import 'package:digital_profile/src/features/table_no_114/data/model/grant_stage_model.dart';
import 'package:digital_profile/src/features/table_no_114/data/repository/grant_stage_repository_impl.dart';
import 'package:digital_profile/src/features/table_no_114/presentation/widgets/grant_stage_bar_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/grant_stage_bloc.dart';
import '../widgets/grant_stage_data_table.dart';

class GrantStagePage extends StatefulWidget {
  String baseUrl, endPoint;

  GrantStagePage(this.baseUrl, this.endPoint, {super.key});

  @override
  State<GrantStagePage> createState() => _GrantStagePageState();
}

class _GrantStagePageState extends State<GrantStagePage> {
  int totalFirst = 0;
  int totalSecond = 0;
  int totalLast = 0;
  int totalNotAvailable = 0;
  int totalTotal = 0;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GrantStageBloc(
          RepositoryProvider.of<ImplGrantStageRepository>(context),
          widget.baseUrl,
          widget.endPoint)
        ..add(GetGrantStageEvent()),
      child: BlocBuilder<GrantStageBloc, GrantStageState>(
        builder: (context, state) {
          if (state is GrantStageSuccessState) {
            List<GrantStageModel> fetchedData = state.fetchedModel;
            fetchedData.asMap().forEach((key, value) {
              totalFirst += fetchedData[key].firstStage ?? 0;
              totalSecond += fetchedData[key].secondStage ?? 0;
              totalLast += fetchedData[key].thirdStage ?? 0;
              totalNotAvailable += fetchedData[key].notAvailable ?? 0;
              totalTotal += fetchedData[key].total ?? 0;
            });
          }
          return Column(
            children: [
              GrantStageBarChart(totalFirst, totalSecond, totalLast,
                  totalNotAvailable, totalTotal),
              verticalspace(),
              GrantStageDataTable(totalFirst, totalSecond, totalLast,
                  totalNotAvailable, totalTotal),
            ],
          );
        },
      ),
    );
  }
}
