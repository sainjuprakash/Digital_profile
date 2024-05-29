import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../app_localization/l10n.dart';
import '../../../../../constant/app_texts/app_title_text.dart';
import '../../../../../constant/spacing.dart';
import '../bloc/disability_bloc.dart';

class DisabilityBarChart extends StatelessWidget {
  int totalAble;
  int totalDisable;
  int totalDeaf;
  int totalBlind;
  int totalHearingLoss;
  int totalSlammer;
  int totalCeleberal;
  int totalRetarded;
  int totalMental;
  int totalMultiDisable;
  int totalNotAvailable;
  int totalWardDis;

  DisabilityBarChart(
      {super.key,
      required this.totalAble,
      required this.totalDisable,
      required this.totalDeaf,
      required this.totalBlind,
      required this.totalHearingLoss,
      required this.totalSlammer,
      required this.totalCeleberal,
      required this.totalRetarded,
      required this.totalMental,
      required this.totalMultiDisable,
      required this.totalNotAvailable,
      required this.totalWardDis});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(children: [
        verticalspace(),
        Center(child: AppTitleText(text: l10n.disabilitytitle)),
        verticalspace(),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: BlocBuilder<DisabilityBloc, DisabilityState>(
            builder: (context, state) {
              if (state is DisabilitySuccessState) {
                return SizedBox(
                  height: 550,
                  width: 1800,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: BarChart(BarChartData(
                      alignment: BarChartAlignment.spaceAround,
                      minY: 0,
                      maxY: 13000,
                      titlesData: FlTitlesData(
                          show: true,
                          topTitles: const AxisTitles(
                              sideTitles: SideTitles(
                            showTitles: false,
                          )),
                          bottomTitles: AxisTitles(
                              sideTitles: SideTitles(
                                  showTitles: true,
                                  reservedSize: 35,
                                  getTitlesWidget: (value, meta) {
                                    final religionLists = [
                                      l10n.able,
                                      l10n.disable,
                                      l10n.deaf,
                                      l10n.blind,
                                      l10n.hearingloss,
                                      l10n.slammer,
                                      l10n.celeberal,
                                      l10n.retarded,
                                      l10n.mental,
                                      l10n.multidisable,
                                      l10n.others
                                    ];
                                    final index = value.toInt();
                                    return Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(religionLists[index]),
                                    );
                                  }))),
                      barGroups: [
                        BarChartGroupData(x: 0, barRods: [
                          BarChartRodData(
                            toY: totalAble.toDouble(),
                            width: 20,
                            borderRadius: BorderRadius.circular(2),
                          )
                        ]),
                        BarChartGroupData(x: 1, barRods: [
                          BarChartRodData(
                            toY: totalDisable.toDouble(),
                            width: 20,
                            borderRadius: BorderRadius.circular(2),
                          )
                        ]),
                        BarChartGroupData(x: 2, barRods: [
                          BarChartRodData(
                            toY: totalDeaf.toDouble(),
                            width: 20,
                            borderRadius: BorderRadius.circular(2),
                          )
                        ]),
                        BarChartGroupData(x: 3, barRods: [
                          BarChartRodData(
                            toY: totalBlind.toDouble(),
                            width: 20,
                            borderRadius: BorderRadius.circular(2),
                          )
                        ]),
                        BarChartGroupData(x: 4, barRods: [
                          BarChartRodData(
                            toY: totalHearingLoss.toDouble(),
                            width: 20,
                            borderRadius: BorderRadius.circular(2),
                          )
                        ]),
                        BarChartGroupData(x: 5, barRods: [
                          BarChartRodData(
                            toY: totalSlammer.toDouble(),
                            width: 20,
                            borderRadius: BorderRadius.circular(2),
                          )
                        ]),
                        BarChartGroupData(x: 6, barRods: [
                          BarChartRodData(
                            toY: totalCeleberal.toDouble(),
                            width: 20,
                            borderRadius: BorderRadius.circular(2),
                          )
                        ]),
                        BarChartGroupData(x: 7, barRods: [
                          BarChartRodData(
                            toY: totalRetarded.toDouble(),
                            width: 20,
                            borderRadius: BorderRadius.circular(2),
                          )
                        ]),
                        BarChartGroupData(x: 8, barRods: [
                          BarChartRodData(
                            toY: totalMental.toDouble(),
                            width: 20,
                            borderRadius: BorderRadius.circular(2),
                          )
                        ]),
                        BarChartGroupData(x: 9, barRods: [
                          BarChartRodData(
                            toY: totalMultiDisable.toDouble(),
                            width: 20,
                            borderRadius: BorderRadius.circular(2),
                          )
                        ]),
                        BarChartGroupData(x: 10, barRods: [
                          BarChartRodData(
                            toY: totalNotAvailable.toDouble(),
                            width: 20,
                            borderRadius: BorderRadius.circular(2),
                          )
                        ]),
                      ],
                    )),
                  ),
                );
              }
              return const Padding(
                padding: EdgeInsets.all(8.0),
                child: Center(child: Text('Something went wrong')),
              );
            },
          ),
        )
      ]),
    );
  }
}
