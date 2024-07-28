import 'package:digital_profile/app_localization/l10n.dart';
import 'package:digital_profile/constant/app_texts/app_title_text.dart';
import 'package:digital_profile/constant/spacing.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/allowance_bloc.dart';

class AllowanceBarChart extends StatelessWidget {
  int totalProcessWrong,
      totalBriddhaBhatta,
      totalWidow,
      totalWidower,
      totalDisabled,
      totalNotTaken,
      totalNotProcessed,
      totalIndigenous,
      totalNotAvailable,
      totalSocialSecurity;

  AllowanceBarChart(
      this.totalProcessWrong,
      this.totalBriddhaBhatta,
      this.totalWidow,
      this.totalWidower,
      this.totalDisabled,
      this.totalNotTaken,
      this.totalNotProcessed,
      this.totalIndigenous,
      this.totalNotAvailable,
      this.totalSocialSecurity,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          verticalspace(),
          AppTitleText(text: l10n.allowanceTitle),
          BlocBuilder<AllowanceBloc, AllowanceState>(
            builder: (context, state) {
              if (state is AllowanceLoadingState) {
                return const Center(
                    child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: CircularProgressIndicator(),
                ));
              }
              if (state is AllowanceSuccessState) {
                return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: SizedBox(
                    height: 550,
                    width: 1000,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: BarChart(BarChartData(
                          minY: 0,
                          maxY: 15000,
                          alignment: BarChartAlignment.spaceAround,
                          titlesData: FlTitlesData(
                            topTitles: const AxisTitles(
                                sideTitles: SideTitles(showTitles: false)),
                            show: true,
                            bottomTitles: AxisTitles(
                              sideTitles: SideTitles(
                                showTitles: true,
                                reservedSize: 35,
                                getTitlesWidget: (value, meta) {
                                  final lists = [
                                    l10n.processWrong,
                                    l10n.briddhaBhatta,
                                    l10n.widow,
                                    l10n.widower,
                                    l10n.disableAllowance,
                                    l10n.notTaken,
                                    l10n.notProcessed,
                                    l10n.indigenous,
                                    l10n.Undisclosed,
                                  ];
                                  final index = value.toInt();
                                  //print(index);
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(lists[index]),
                                  );
                                },
                              ),
                            ),
                          ),
                          barGroups: [
                            BarChartGroupData(x: 0, barRods: [
                              BarChartRodData(
                                  toY: totalProcessWrong.toDouble(),
                                  width: 20,
                                  borderRadius: BorderRadius.circular(2))
                            ]),
                            BarChartGroupData(x: 1, barRods: [
                              BarChartRodData(
                                  toY: totalBriddhaBhatta.toDouble(),
                                  width: 20,
                                  borderRadius: BorderRadius.circular(2))
                            ]),
                            BarChartGroupData(x: 2, barRods: [
                              BarChartRodData(
                                  toY: totalWidow.toDouble(),
                                  width: 20,
                                  borderRadius: BorderRadius.circular(2))
                            ]),
                            BarChartGroupData(x: 3, barRods: [
                              BarChartRodData(
                                  toY: totalWidower.toDouble(),
                                  width: 20,
                                  borderRadius: BorderRadius.circular(2))
                            ]),
                            BarChartGroupData(x: 4, barRods: [
                              BarChartRodData(
                                  toY: totalDisabled.toDouble(),
                                  width: 20,
                                  borderRadius: BorderRadius.circular(2))
                            ]),
                            BarChartGroupData(x: 5, barRods: [
                              BarChartRodData(
                                  toY: totalNotTaken.toDouble(),
                                  width: 20,
                                  borderRadius: BorderRadius.circular(2))
                            ]),
                            BarChartGroupData(x: 6, barRods: [
                              BarChartRodData(
                                  toY: totalNotProcessed.toDouble(),
                                  width: 20,
                                  borderRadius: BorderRadius.circular(2))
                            ]),
                            BarChartGroupData(x: 7, barRods: [
                              BarChartRodData(
                                  toY: totalIndigenous.toDouble(),
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
              if (state is AllowanceFailureState) {
                return Center(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(l10n.loadDataFail),
                  ),
                );
              }
              return Center(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(l10n.unknownError),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
