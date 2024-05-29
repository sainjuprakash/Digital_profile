import 'package:digital_profile/app_localization/l10n.dart';
import 'package:digital_profile/constant/app_texts/app_title_text.dart';
import 'package:digital_profile/constant/spacing.dart';
import 'package:digital_profile/src/features/health_condition/presentation/bloc/health_condition_bloc.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HealthConditionBarChart extends StatelessWidget {
  int totalHealthy;
  int totalGeneralDisease;
  int totalLongTermDisease;
  int totalCovid;
  int totalNotAvailable;
  int totalWardHealthCondition;

  HealthConditionBarChart(
      {super.key,
      required this.totalHealthy,
      required this.totalGeneralDisease,
      required this.totalLongTermDisease,
      required this.totalCovid,
      required this.totalNotAvailable,
      required this.totalWardHealthCondition});

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Column(
      children: [
        verticalspace(),
        Center(child: AppTitleText(text: l10n.healthconditiontitle)),
        verticalspace(),
        BlocBuilder<HealthConditionBloc, HealthConditionState>(
            builder: (context, state) {
          if (state is HealthConditionLoadingState) {
            return const Center(
                child: Padding(
              padding: EdgeInsets.all(8.0),
              child: CircularProgressIndicator(),
            ));
          }
          if (state is HealthConditionSuccessState) {
            return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: SizedBox(
                height: 550,
                width: 630,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: BarChart(BarChartData(
                      minY: 0,
                      maxY: 13000,
                      alignment: BarChartAlignment.spaceAround,
                      titlesData: FlTitlesData(
                          topTitles: const AxisTitles(
                              sideTitles: SideTitles(showTitles: false)),
                          bottomTitles: AxisTitles(
                              sideTitles: SideTitles(
                                  showTitles: true,
                                  reservedSize: 35,
                                  getTitlesWidget: (value, meta) {
                                    final residenceRepresentation = [
                                      l10n.healthy,
                                      l10n.generalDisease,
                                      l10n.longTermDisease,
                                      l10n.covid,
                                      l10n.notavailable,
                                    ];
                                    int index = value.toInt();
                                    return Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child:
                                          Text(residenceRepresentation[index]),
                                    );
                                  }))),
                      barGroups: [
                        BarChartGroupData(x: 0, barRods: [
                          BarChartRodData(
                              toY: totalHealthy.toDouble(),
                              width: 20,
                              borderRadius: BorderRadius.circular(2))
                        ]),
                        BarChartGroupData(x: 1, barRods: [
                          BarChartRodData(
                              toY: totalGeneralDisease.toDouble(),
                              width: 20,
                              borderRadius: BorderRadius.circular(2))
                        ]),
                        BarChartGroupData(x: 2, barRods: [
                          BarChartRodData(
                              toY: totalLongTermDisease.toDouble(),
                              width: 20,
                              borderRadius: BorderRadius.circular(2))
                        ]),
                        BarChartGroupData(x: 3, barRods: [
                          BarChartRodData(
                              toY: totalCovid.toDouble(),
                              width: 20,
                              borderRadius: BorderRadius.circular(2))
                        ]),
                        BarChartGroupData(x: 4, barRods: [
                          BarChartRodData(
                              toY: totalNotAvailable.toDouble(),
                              width: 20,
                              borderRadius: BorderRadius.circular(2))
                        ]),
                      ])),
                ),
              ),
            );
          }
          if (state is HealthConditionFailureState) {
            return const Padding(
              padding: EdgeInsets.all(8.0),
              child: Center(child: Text('Unable to load health data')),
            );
          }
          return const Padding(
            padding: EdgeInsets.all(8.0),
            child: Center(child: Text('Something went wrong')),
          );
        }),
      ],
    ));
  }
}
