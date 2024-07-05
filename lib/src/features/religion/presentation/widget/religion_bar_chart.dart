import 'package:digital_profile/app_localization/l10n.dart';
import 'package:digital_profile/constant/app_texts/app_title_text.dart';
import 'package:digital_profile/constant/spacing.dart';
import 'package:digital_profile/src/features/religion/presentation/bloc/religion_bloc.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../ethnicity_population/presentation/bloc/ethnicity_population_bloc.dart';

class ReligionBarChart extends StatelessWidget {
  int totalHindu;
  int totalBoudha;
  int totalChristian;
  int totalMuslim;
  int totalKirat;
  int totalJains;
  int totalBon;
  int totalOthers;
  int totalNotAvailable;
  int totalWardRel;
  ReligionBarChart(
      {super.key,
      required this.totalHindu,
      required this.totalBoudha,
      required this.totalChristian,
      required this.totalMuslim,
      required this.totalKirat,
      required this.totalJains,
      required this.totalBon,
      required this.totalOthers,
      required this.totalNotAvailable,
      required this.totalWardRel});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          verticalspace(),
          Center(child: AppTitleText(text: l10n.religiontitle)),
          verticalspace(),
          BlocBuilder<ReligionBloc, ReligionState>(builder: (context, state) {
            if (state is ReligionLoadingState) {
              return const Padding(
                padding: EdgeInsets.all(8.0),
                child: Center(child: CircularProgressIndicator()),
              );
            }
            if (state is ReligionSuccessState) {
              return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 550,
                    width: 800,
                    child: BarChart(BarChartData(
                        alignment: BarChartAlignment.spaceAround,
                        minY: 0,
                        maxY: 8000,
                        titlesData: FlTitlesData(
                            show: true,
                            topTitles: const AxisTitles(
                                sideTitles: SideTitles(showTitles: false)),
                            bottomTitles: AxisTitles(
                                sideTitles: SideTitles(
                                    showTitles: true,
                                    reservedSize: 35,
                                    getTitlesWidget: (value, meta) {
                                      final religionLists = [
                                        l10n.hindu,
                                        l10n.boudha,
                                        l10n.christian,
                                        l10n.muslim,
                                        l10n.kirat,
                                        l10n.jains,
                                        l10n.bon,
                                        l10n.others,
                                        l10n.notavailable,
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
                                toY: totalHindu.toDouble(),
                                width: 20,
                                borderRadius: BorderRadius.circular(2))
                          ]),
                          BarChartGroupData(x: 1, barRods: [
                            BarChartRodData(
                                toY: totalBoudha.toDouble(),
                                width: 20,
                                borderRadius: BorderRadius.circular(2))
                          ]),

                          BarChartGroupData(x: 2, barRods: [
                            BarChartRodData(
                                toY: totalChristian.toDouble(),
                                width: 20,
                                borderRadius: BorderRadius.circular(2))
                          ]),
                          BarChartGroupData(x: 3, barRods: [
                            BarChartRodData(
                                toY: totalMuslim.toDouble(),
                                width: 20,
                                borderRadius: BorderRadius.circular(2))
                          ]),
                          BarChartGroupData(x: 4, barRods: [
                            BarChartRodData(
                                toY: totalKirat.toDouble(),
                                width: 20,
                                borderRadius: BorderRadius.circular(2))
                          ]),
                          BarChartGroupData(x: 5, barRods: [
                            BarChartRodData(
                                toY: totalJains.toDouble(),
                                width: 20,
                                borderRadius: BorderRadius.circular(2))
                          ]),
                          BarChartGroupData(x: 6, barRods: [
                            BarChartRodData(
                                toY: totalBon.toDouble(),
                                width: 20,
                                borderRadius: BorderRadius.circular(2))
                          ]),
                          BarChartGroupData(x: 7, barRods: [
                            BarChartRodData(
                                toY: totalOthers.toDouble(),
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
                  ),
                ),
              );
            }
            if (state is ReligionFailureState) {
              return const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('Unable to load religion data'),
              );
            }
            return const Padding(
              padding: EdgeInsets.all(8.0),
              child: Center(child: Text('Something went wrong')),
            );
          }),
        ],
      ),
    );
  }
}
