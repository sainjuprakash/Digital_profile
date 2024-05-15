import 'package:digital_profile/src/features/health_condition/data/model/health_condition_model.dart';
import 'package:digital_profile/src/features/health_condition/data/repository/health_condition_repository_impl.dart';
import 'package:digital_profile/src/features/health_condition/presentation/widgets/health_condition_bar_chart.dart';
import 'package:digital_profile/src/features/marriage/data/model/marriage_status_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../marriage/presentation/bloc/marriage_status_bloc.dart';
import '../bloc/health_condition_bloc.dart';

class HealthConditionPage extends StatefulWidget {
  const HealthConditionPage({super.key});

  @override
  State<HealthConditionPage> createState() => _HealthConditionPageState();
}

class _HealthConditionPageState extends State<HealthConditionPage> {
  int totalHealthy = 0;
  int totalGeneralDisease = 0;
  int totalLongTermDisease = 0;
  int totalCovid = 0;
  int totalNotAvailable = 0;
  int totalWardHealthCondition = 0;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HealthConditionBloc(
          RepositoryProvider.of<ImplHealthConditionRepository>(context))
        ..add(GetHealthConditionEvent()),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueAccent,
          elevation: 50,
        ),
        body: BlocBuilder<HealthConditionBloc, HealthConditionState>(
          builder: (context, state) {
            if (state is HealthConditionSuccessState) {
              List<HealthConditionModel> fetchedHealthData =
                  state.healthConditionModel;
              fetchedHealthData.asMap().forEach((key, value) {
                totalHealthy += fetchedHealthData[key].healthy ?? 0;
                totalGeneralDisease +=
                    fetchedHealthData[key].generalDisease ?? 0;
                totalLongTermDisease +=
                    fetchedHealthData[key].longTermDisease ?? 0;
                totalCovid += fetchedHealthData[key].covid ?? 0;
                totalNotAvailable += fetchedHealthData[key].notAvailable ?? 0;
                totalWardHealthCondition +=
                    fetchedHealthData[key].totalWardHealthCondition ?? 0;
              });
            }
            return Column(
              children: [
                HealthConditionBarChart(
                    totalHealthy: totalHealthy,
                    totalGeneralDisease: totalGeneralDisease,
                    totalLongTermDisease: totalLongTermDisease,
                    totalCovid: totalCovid,
                    totalNotAvailable: totalNotAvailable,
                    totalWardHealthCondition: totalWardHealthCondition),
              ],
            );
          },
        ),
      ),
    );
  }
}