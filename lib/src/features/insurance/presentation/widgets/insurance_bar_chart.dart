import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../app_localization/l10n.dart';
import '../../../../../constant/app_texts/app_title_text.dart';
import '../../../../../constant/spacing.dart';
import '../bloc/insurance_bloc.dart';

class InsuranceBarChart extends StatelessWidget {
  int totalLifeInsurance;
  int totalHealthInsurance;
  int totalLiveStockInsurance;
  int totalOthersInsurance;
  int totalNotAvailable;
  int totalInsurance;

  InsuranceBarChart({
    super.key,
    required this.totalLifeInsurance,
    required this.totalHealthInsurance,
    required this.totalLiveStockInsurance,
    required this.totalOthersInsurance,
    required this.totalNotAvailable,
    required this.totalInsurance,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          verticalspace(),
          AppTitleText(text: l10n.insuranceTitle),
          verticalspace(),
          BlocBuilder<InsuranceBloc, InsuranceState>(
            builder: (context, state) {
              if (state is InsuranceLoadingState) {
                return const Center(
                    child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: CircularProgressIndicator(),
                ));
              }
              if (state is InsuranceSuccessState) {
                return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: SizedBox(
                    height: 550,
                    width: 600,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: BarChart(BarChartData(
                          alignment: BarChartAlignment.spaceAround,
                          minY: 0,
                          maxY: 5000,
                          titlesData: FlTitlesData(
                              topTitles: const AxisTitles(
                                  sideTitles: SideTitles(showTitles: false)),
                              bottomTitles: AxisTitles(
                                  sideTitles: SideTitles(
                                      showTitles: true,
                                      reservedSize: 35,
                                      getTitlesWidget: (value, meta) {
                                        final residenceRepresentation = [
                                          l10n.lifeInsurance,
                                          l10n.healthInsurance,
                                          l10n.liveStockInsurance,
                                          l10n.othersInsurance,
                                          l10n.noInsurance,
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
                                  toY: totalLifeInsurance.toDouble(),
                                  width: 20,
                                  borderRadius: BorderRadius.circular(2))
                            ]),
                            BarChartGroupData(x: 1, barRods: [
                              BarChartRodData(
                                  toY: totalHealthInsurance.toDouble(),
                                  width: 20,
                                  borderRadius: BorderRadius.circular(2))
                            ]),
                            BarChartGroupData(x: 2, barRods: [
                              BarChartRodData(
                                  toY: totalLiveStockInsurance.toDouble(),
                                  width: 20,
                                  borderRadius: BorderRadius.circular(2))
                            ]),
                            BarChartGroupData(x: 3, barRods: [
                              BarChartRodData(
                                  toY: totalOthersInsurance.toDouble(),
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
              if (state is InsuranceFailureState) {
                return const Center(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("Unable to load insurance data"),
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
          )
        ],
      ),
    );
  }
}
