import 'package:digital_profile/app_localization/l10n.dart';
import 'package:digital_profile/constant/app_texts/app_title_text.dart';
import 'package:digital_profile/constant/spacing.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/residence_bloc.dart';

class ResidenceBarChart extends StatelessWidget {
  int totalDefault;
  int totalForeign;
  int totalCountrySide;
  int totalNotAvailable;
  int totalLivingStatus;

  ResidenceBarChart(
      {super.key,
      required this.totalDefault,
      required this.totalForeign,
      required this.totalCountrySide,
      required this.totalNotAvailable,
      required this.totalLivingStatus});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          verticalspace(),
          AppTitleText(text: l10n.residencetitle),
          verticalspace(),
          BlocBuilder<ResidenceBloc, ResidenceState>(builder: (context, state) {
            if (state is ResidenceSuccessState) {
              return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: SizedBox(
                  height: 550,
                  width: 700,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: BarChart(BarChartData(
                      minY: 0,
                      maxY: 7000,
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
                                      l10n.defaultresidence,
                                      l10n.countryside,
                                      l10n.foreign,
                                      l10n.notavailable
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
                            toY: totalDefault.toDouble(),
                            width: 20,
                            borderRadius: BorderRadius.circular(2),
                          )
                        ]),
                        BarChartGroupData(x: 1, barRods: [
                          BarChartRodData(
                            toY: totalCountrySide.toDouble(),
                            width: 20,
                            borderRadius: BorderRadius.circular(2),
                          )
                        ]),
                        BarChartGroupData(x: 2, barRods: [
                          BarChartRodData(
                            toY: totalForeign.toDouble(),
                            width: 20,
                            borderRadius: BorderRadius.circular(2),
                          )
                        ]),
                        BarChartGroupData(x: 3, barRods: [
                          BarChartRodData(
                            toY: totalNotAvailable.toDouble(),
                            width: 20,
                            borderRadius: BorderRadius.circular(2),
                          )
                        ]),
                      ],
                    )),
                  ),
                ),
              );
            }
            if (state is ResidenceLoadingState) {
              return const Center(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: CircularProgressIndicator(),
                ),
              );
            }
            if (state is ResidenceFailureState) {
              return const Center(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Unable to load residence data'),
                ),
              );
            }
            return const Center(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('Something went wrong'),
              ),
            );
          }),
        ],
      ),
    );
  }
}
