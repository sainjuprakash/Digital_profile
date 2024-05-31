import 'package:digital_profile/app_localization/l10n.dart';
import 'package:digital_profile/constant/app_texts/app_title_text.dart';
import 'package:digital_profile/constant/spacing.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/house_bloc.dart';

class HouseRoofBarChart extends StatelessWidget {
  int totalKhar;
  int totalJasta;
  int totalStoneTile;
  int totalRcc;
  int totalWood;
  int totalMud;
  int totalOthers;
  int totalNotAvailable;
  int totalWardRoof;

  HouseRoofBarChart(
      this.totalKhar,
      this.totalJasta,
      this.totalStoneTile,
      this.totalRcc,
      this.totalWood,
      this.totalMud,
      this.totalOthers,
      this.totalNotAvailable,
      this.totalWardRoof,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          verticalspace(),
          AppTitleText(text: l10n.houseFacilityTitle),
          verticalspace(),
          BlocBuilder<HouseBloc, HouseState>(
            builder: (context, state) {
              if (state is HouseLoadingState) {
                return const Center(
                    child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: CircularProgressIndicator(),
                ));
              }
              if (state is HouseSuccessState) {
                return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: SizedBox(
                      height: 550,
                      width: 900,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: BarChart(BarChartData(
                          alignment: BarChartAlignment.spaceAround,
                          minY: 0,
                          maxY: 3000,
                          titlesData: FlTitlesData(
                              show: true,
                              topTitles: const AxisTitles(
                                  sideTitles: SideTitles(showTitles: false)),
                              bottomTitles: AxisTitles(
                                  sideTitles: SideTitles(
                                      showTitles: true,
                                      reservedSize: 60,
                                      getTitlesWidget: (value, meta) {
                                        final religionLists = [
                                          '${l10n.khar}\n${l10n.roof}',
                                          '${l10n.jasta}\n${l10n.roof}',
                                          '${l10n.stoneRoof}\n${l10n.roof}',
                                          l10n.rcc,
                                          '${l10n.wood}\n${l10n.roof}',
                                          '${l10n.mud}\n${l10n.roof}',
                                          l10n.others,
                                          l10n.notavailable,
                                          l10n.total
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
                                  toY: totalKhar.toDouble(),
                                  width: 20,
                                  borderRadius: BorderRadius.circular(2))
                            ]),
                            BarChartGroupData(x: 1, barRods: [
                              BarChartRodData(
                                  toY: totalJasta.toDouble(),
                                  width: 20,
                                  borderRadius: BorderRadius.circular(2))
                            ]),
                            BarChartGroupData(x: 2, barRods: [
                              BarChartRodData(
                                  toY: totalStoneTile.toDouble(),
                                  width: 20,
                                  borderRadius: BorderRadius.circular(2))
                            ]),
                            BarChartGroupData(x: 3, barRods: [
                              BarChartRodData(
                                  toY: totalRcc.toDouble(),
                                  width: 20,
                                  borderRadius: BorderRadius.circular(2))
                            ]),
                            BarChartGroupData(x: 4, barRods: [
                              BarChartRodData(
                                  toY: totalWood.toDouble(),
                                  width: 20,
                                  borderRadius: BorderRadius.circular(2))
                            ]),
                            BarChartGroupData(x: 5, barRods: [
                              BarChartRodData(
                                  toY: totalMud.toDouble(),
                                  width: 20,
                                  borderRadius: BorderRadius.circular(2))
                            ]),
                            BarChartGroupData(x: 6, barRods: [
                              BarChartRodData(
                                  toY: totalOthers.toDouble(),
                                  width: 20,
                                  borderRadius: BorderRadius.circular(2))
                            ]),
                            BarChartGroupData(x: 7, barRods: [
                              BarChartRodData(
                                  toY: totalNotAvailable.toDouble(),
                                  width: 20,
                                  borderRadius: BorderRadius.circular(2))
                            ]),
                          ],
                        )),
                      )),
                );
              }
              if (state is HouseFailureState) {
                return const Center(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("Unable to load data"),
                  ),
                );
              }
              return const Center(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text("Something went Wrong"),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
