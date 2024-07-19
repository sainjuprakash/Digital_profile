import 'package:digital_profile/app_localization/l10n.dart';
import 'package:digital_profile/constant/app_texts/app_title_text.dart';
import 'package:digital_profile/constant/spacing.dart';
import 'package:digital_profile/src/features/language/presentation/bloc/language_bloc.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/marriage_status_bloc.dart';

class MarriageBarChart extends StatelessWidget {
  int totalSingleCount;
  int totalMarriedCount;
  int totalSingleWoman;
  int totalSingleManCount;
  int totalPolygami;
  int totalDivorced;
  int totalRemarried;
  int totalSeperated;
  int totalUnderage;
  int totalNotAvailable;
  int totalMaritalStatus;

  MarriageBarChart(
      {super.key,
      required this.totalSingleCount,
      required this.totalMarriedCount,
      required this.totalSingleWoman,
      required this.totalSingleManCount,
      required this.totalPolygami,
      required this.totalDivorced,
      required this.totalRemarried,
      required this.totalSeperated,
      required this.totalUnderage,
      required this.totalNotAvailable,
      required this.totalMaritalStatus});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          verticalspace(),
          Center(
              child: AppTitleText(
            text: l10n.marriagetitle,
          )),
          verticalspace(),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: BlocBuilder<MarriageStatusBloc, MarriageStatusState>(
                builder: (context, state) {
                  if (state is MarriageLoadingState) {
                    return const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Center(child: CircularProgressIndicator()),
                    );
                  }
                  if (state is MarriageSuccessState) {
                    return SizedBox(
                      height: 550,
                      width: 1100,
                      child: BarChart(BarChartData(
                          alignment: BarChartAlignment.spaceAround,
                          minY: 0,
                          maxY: 15000,
                          titlesData: FlTitlesData(
                              topTitles: const AxisTitles(
                                  sideTitles: SideTitles(showTitles: false)),
                              bottomTitles: AxisTitles(
                                  sideTitles: SideTitles(
                                      showTitles: true,
                                      reservedSize: 35,
                                      getTitlesWidget: (value, meta) {
                                        final residenceRepresentation = [
                                          l10n.single,
                                          l10n.married,
                                          l10n.polygami,
                                          l10n.remarried,
                                          '${l10n.singleman},${l10n.singlewomen}',
                                          l10n.divorced,
                                          l10n.seperated,
                                          l10n.underage,
                                          l10n.notavailable
                                        ];
                                        int index = value.toInt();
                                        return Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                              residenceRepresentation[index]),
                                        );
                                      }))),
                          barGroups: [
                            BarChartGroupData(x: 0, barRods: [
                              BarChartRodData(
                                  toY: totalSingleCount.toDouble(),
                                  width: 20,
                                  borderRadius: BorderRadius.circular(2))
                            ]),
                            BarChartGroupData(x: 1, barRods: [
                              BarChartRodData(
                                  toY: totalMarriedCount.toDouble(),
                                  width: 20,
                                  borderRadius: BorderRadius.circular(2))
                            ]),
                            BarChartGroupData(x: 2, barRods: [
                              BarChartRodData(
                                  toY: totalPolygami.toDouble(),
                                  width: 20,
                                  borderRadius: BorderRadius.circular(2))
                            ]),
                            BarChartGroupData(x: 3, barRods: [
                              BarChartRodData(
                                  toY: totalRemarried.toDouble(),
                                  width: 20,
                                  borderRadius: BorderRadius.circular(2))
                            ]),
                            BarChartGroupData(x: 4, barRods: [
                              BarChartRodData(
                                  toY: totalSingleWoman.toDouble(),
                                  width: 20,
                                  borderRadius: BorderRadius.circular(2))
                            ]),
                            BarChartGroupData(x: 5, barRods: [
                              BarChartRodData(
                                  toY: totalDivorced.toDouble(),
                                  width: 20,
                                  borderRadius: BorderRadius.circular(2))
                            ]),
                            BarChartGroupData(x: 6, barRods: [
                              BarChartRodData(
                                  toY: totalSeperated.toDouble(),
                                  width: 20,
                                  borderRadius: BorderRadius.circular(2))
                            ]),
                            BarChartGroupData(x: 7, barRods: [
                              BarChartRodData(
                                  toY: totalUnderage.toDouble(),
                                  width: 20,
                                  borderRadius: BorderRadius.circular(2))
                            ]),
                            BarChartGroupData(x: 8, barRods: [
                              BarChartRodData(
                                  toY: totalNotAvailable.toDouble(),
                                  width: 20,
                                  borderRadius: BorderRadius.circular(2))
                            ]),
                          ])),
                    );
                  }
                  if (state is MarriageFailureState) {
                    return const Padding(
                      padding: EdgeInsets.all(8.0),
                      child:
                          Center(child: Text('Unable to load marriage data')),
                    );
                  }

                  return const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Center(child: Text('Something went wrong')),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
