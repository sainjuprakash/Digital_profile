import 'package:digital_profile/app_localization/l10n.dart';
import 'package:digital_profile/constant/app_texts/app_title_text.dart';
import 'package:digital_profile/constant/spacing.dart';
import 'package:digital_profile/src/features/population/presentation/bloc/population_bloc.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/age_population_bloc.dart';

class AgePopulationBarChart extends StatelessWidget {
  int totalMaleLessThanSix;
  int totalMaleSixToFifteen;
  int totalMaleSixteenToFortyNine;
  int totalMaleFiftyToSixtyNine;
  int totalMaleSeventyToNinety;
  int totalMaleAboveNinety;
  int totalFemaleLessThanSix;
  int totalFemaleSixToFifteen;
  int totalFemaleSixteenToFortyNine;
  int totalFemaleFiftyToSixtyNine;
  int totalFemaleSeventyToNinety;
  int totalFemaleNinetyAbove;
  int totalOthersLessThanSix;
  int totalOthersSixToFifteen;
  int totalOthersSixteenToFortyNine;
  int totalOthersFiftyToSixtyNine;
  int totalOthersSeventyToNinety;
  int totalOthersAboveNinety;
  int totalWardCount;

  AgePopulationBarChart(
      {super.key,
      required this.totalMaleLessThanSix,
      required this.totalMaleSixToFifteen,
      required this.totalMaleSixteenToFortyNine,
      required this.totalMaleFiftyToSixtyNine,
      required this.totalMaleSeventyToNinety,
      required this.totalMaleAboveNinety,
      required this.totalFemaleLessThanSix,
      required this.totalFemaleSixToFifteen,
      required this.totalFemaleSixteenToFortyNine,
      required this.totalFemaleFiftyToSixtyNine,
      required this.totalFemaleSeventyToNinety,
      required this.totalFemaleNinetyAbove,
      required this.totalOthersLessThanSix,
      required this.totalOthersSixToFifteen,
      required this.totalOthersSixteenToFortyNine,
      required this.totalOthersFiftyToSixtyNine,
      required this.totalOthersSeventyToNinety,
      required this.totalOthersAboveNinety,
      required this.totalWardCount});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          verticalspace(),
          Center(child: AppTitleText(text: l10n.populationClassificationtitle)),
          verticalspace(),
          BlocBuilder<AgePopulationBloc, AgePopulationState>(
            builder: (context, state) {
              if (state is AgePopulationLoadingState) {
                return const Center(
                    child: Padding(
                  padding: EdgeInsets.all(20.0),
                  child: CircularProgressIndicator(),
                ));
              }
              if (state is AgePopulationSuccessState) {
                return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: SizedBox(
                      height: 550,
                      width: 800,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: BarChart(BarChartData(
                            minY: 0,
                            maxY: 10000,
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
                                            l10n.lessthan6,
                                            l10n.sixttofifteen,
                                            l10n.sixteentofourtynine,
                                            l10n.fiftytosixtynine,
                                            l10n.seventytoninety,
                                            l10n.above90,
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
                                    toY: totalMaleLessThanSix.toDouble(),
                                    width: 20,
                                    borderRadius: BorderRadius.circular(2)),
                                BarChartRodData(
                                    toY: totalFemaleLessThanSix.toDouble(),
                                    width: 20,
                                    color: const Color(0xFF1976D2),
                                    borderRadius: BorderRadius.circular(2)),
                                BarChartRodData(
                                    toY: totalOthersLessThanSix.toDouble(),
                                    width: 20,
                                    color: Colors.pinkAccent,
                                    borderRadius: BorderRadius.circular(2)),
                              ]),
                              BarChartGroupData(x: 1, barRods: [
                                BarChartRodData(
                                    toY: totalMaleSixToFifteen.toDouble(),
                                    width: 20,
                                    borderRadius: BorderRadius.circular(2)),
                                BarChartRodData(
                                    toY: totalFemaleSixToFifteen.toDouble(),
                                    width: 20,
                                    color: const Color(0xFF1976D2),
                                    borderRadius: BorderRadius.circular(2)),
                                BarChartRodData(
                                    toY: totalOthersSixToFifteen.toDouble(),
                                    width: 20,
                                    color: Colors.pinkAccent,
                                    borderRadius: BorderRadius.circular(2)),
                              ]),
                              BarChartGroupData(x: 2, barRods: [
                                BarChartRodData(
                                    toY: totalMaleSixteenToFortyNine.toDouble(),
                                    width: 20,
                                    borderRadius: BorderRadius.circular(2)),
                                BarChartRodData(
                                    toY: totalFemaleSixteenToFortyNine
                                        .toDouble(),
                                    width: 20,
                                    color: const Color(0xFF1976D2),
                                    borderRadius: BorderRadius.circular(2)),
                                BarChartRodData(
                                    toY: totalOthersSixteenToFortyNine
                                        .toDouble(),
                                    width: 20,
                                    color: Colors.pinkAccent,
                                    borderRadius: BorderRadius.circular(2)),
                              ]),
                              BarChartGroupData(x: 3, barRods: [
                                BarChartRodData(
                                    toY: totalMaleFiftyToSixtyNine.toDouble(),
                                    width: 20,
                                    borderRadius: BorderRadius.circular(2)),
                                BarChartRodData(
                                    toY: totalFemaleFiftyToSixtyNine.toDouble(),
                                    width: 20,
                                    color: const Color(0xFF1976D2),
                                    borderRadius: BorderRadius.circular(2)),
                                BarChartRodData(
                                    toY: totalOthersFiftyToSixtyNine.toDouble(),
                                    width: 20,
                                    color: Colors.pinkAccent,
                                    borderRadius: BorderRadius.circular(2)),
                              ]),
                              BarChartGroupData(x: 4, barRods: [
                                BarChartRodData(
                                    toY: totalMaleSeventyToNinety.toDouble(),
                                    width: 20,
                                    borderRadius: BorderRadius.circular(2)),
                                BarChartRodData(
                                    toY: totalFemaleSeventyToNinety.toDouble(),
                                    width: 20,
                                    color: const Color(0xFF1976D2),
                                    borderRadius: BorderRadius.circular(2)),
                                BarChartRodData(
                                    toY: totalOthersSeventyToNinety.toDouble(),
                                    width: 20,
                                    color: Colors.pinkAccent,
                                    borderRadius: BorderRadius.circular(2)),
                              ]),
                              BarChartGroupData(x: 5, barRods: [
                                BarChartRodData(
                                    toY: totalMaleAboveNinety.toDouble(),
                                    width: 20,
                                    borderRadius: BorderRadius.circular(2)),
                                BarChartRodData(
                                    toY: totalFemaleNinetyAbove.toDouble(),
                                    width: 20,
                                    color: const Color(0xFF1976D2),
                                    borderRadius: BorderRadius.circular(2)),
                                BarChartRodData(
                                    toY: totalOthersAboveNinety.toDouble(),
                                    width: 20,
                                    color: Colors.pinkAccent,
                                    borderRadius: BorderRadius.circular(2)),
                              ]),
                            ])),
                      )),
                );
              }
              if (state is AgePopulationFailureState) {
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
          )
        ],
      ),
    );
  }
}
