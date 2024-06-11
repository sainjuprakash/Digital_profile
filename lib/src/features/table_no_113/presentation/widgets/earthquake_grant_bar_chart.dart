import 'package:digital_profile/app_localization/l10n.dart';
import 'package:digital_profile/constant/app_texts/app_title_text.dart';
import 'package:digital_profile/constant/spacing.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/earthquake_grant_bloc.dart';

class EarthquakeGrantBarChart extends StatelessWidget {
  int totalGotGrant, totalHasNotGotGranted, totalNotAvailable;

  EarthquakeGrantBarChart(
      this.totalNotAvailable, this.totalHasNotGotGranted, this.totalGotGrant,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          verticalspace(),
          AppTitleText(text: l10n.earthquakeGrantTitle),
          verticalspace(),
          BlocBuilder<EarthquakeGrantBloc, EarthquakeGrantState>(
            builder: (context, state) {
              if (state is EarthquakeGrantLoadingState) {
                return const Center(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: CircularProgressIndicator(),
                  ),
                );
              }
              if (state is EarthquakeGrantSuccessState) {
                return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: SizedBox(
                      height: 550,
                      width: 400,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: BarChart(BarChartData(
                            minY: 0,
                            maxY: 4000,
                            alignment: BarChartAlignment.spaceAround,
                            titlesData: FlTitlesData(
                              topTitles: const AxisTitles(
                                  sideTitles: SideTitles(
                                showTitles: false,
                              )),
                              bottomTitles: AxisTitles(
                                sideTitles: SideTitles(
                                  showTitles: true,
                                  reservedSize: 36,
                                  getTitlesWidget: (value, meta) {
                                    final lists = [
                                      l10n.got,
                                      l10n.doesNotGot,
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
                                    toY: totalGotGrant.toDouble(),
                                    width: 20,
                                    borderRadius: BorderRadius.circular(2))
                              ]),
                              BarChartGroupData(x: 1, barRods: [
                                BarChartRodData(
                                    toY: totalHasNotGotGranted.toDouble(),
                                    width: 20,
                                    borderRadius: BorderRadius.circular(2))
                              ]),
                              BarChartGroupData(x: 2, barRods: [
                                BarChartRodData(
                                    toY: totalNotAvailable.toDouble(),
                                    width: 20,
                                    borderRadius: BorderRadius.circular(2))
                              ]),
                            ])),
                      )),
                );
              }
              if (state is EarthquakeGrantFailureState) {}
              return const Padding(
                padding: EdgeInsets.all(8.0),
                child: Center(child: Text("Unable to load data")),
              );

              return const Padding(
                padding: EdgeInsets.all(8.0),
                child: Center(child: Text("Something went wrong")),
              );
            },
          )
        ],
      ),
    );
  }
}
