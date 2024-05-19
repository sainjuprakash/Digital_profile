import 'package:digital_profile/app_localization/l10n.dart';
import 'package:digital_profile/constant/app_texts/app_title_text.dart';
import 'package:digital_profile/constant/spacing.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/electricity_bloc.dart';

class ElectricityBarChart extends StatelessWidget {
  int totalKerosene;
  int totalBioGas;
  int totalSolar;
  int totalElectricityLaghu;
  int totalElectricityNational;
  int totalElectricityOthers;
  int totalNotAvailable;
  int totalHouseCount;

  ElectricityBarChart(
      {super.key,
      required this.totalKerosene,
      required this.totalBioGas,
      required this.totalSolar,
      required this.totalElectricityLaghu,
      required this.totalElectricityNational,
      required this.totalElectricityOthers,
      required this.totalNotAvailable,
      required this.totalHouseCount});

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Column(
      children: [
        verticalspace(),
        AppTitleText(text: l10n.electricityTitle),
        verticalspace(),
        BlocBuilder<ElectricityBloc, ElectricityState>(
          builder: (context, state) {
            if (state is ElectricityLoadingState) {
              return const Center(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: CircularProgressIndicator(),
                ),
              );
            }
            if (state is ElectricitySuccessState) {
              return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: SizedBox(
                  height: 600,
                  width: 780,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: BarChart(BarChartData(
                        alignment: BarChartAlignment.spaceAround,
                        minY: 0,
                        maxY: 3000,
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
                                // print(value);
                                // print(meta);
                                final lists = [
                                  l10n.kerosene,
                                  l10n.bioGas,
                                  l10n.solar,
                                  l10n.electricityLaghu,
                                  l10n.electricityNational,
                                  l10n.others,
                                  l10n.notavailable
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
                                toY: totalKerosene.toDouble(),
                                width: 20,
                                borderRadius: BorderRadius.circular(2))
                          ]),
                          BarChartGroupData(x: 1, barRods: [
                            BarChartRodData(
                                toY: totalBioGas.toDouble(),
                                width: 20,
                                borderRadius: BorderRadius.circular(2))
                          ]),
                          BarChartGroupData(x: 2, barRods: [
                            BarChartRodData(
                                toY: totalSolar.toDouble(),
                                width: 20,
                                borderRadius: BorderRadius.circular(2))
                          ]),
                          BarChartGroupData(x: 3, barRods: [
                            BarChartRodData(
                                toY: totalElectricityLaghu.toDouble(),
                                width: 20,
                                borderRadius: BorderRadius.circular(2))
                          ]),
                          BarChartGroupData(x: 4, barRods: [
                            BarChartRodData(
                                toY: totalElectricityNational.toDouble(),
                                width: 20,
                                borderRadius: BorderRadius.circular(2))
                          ]),
                          BarChartGroupData(x: 5, barRods: [
                            BarChartRodData(
                                toY: totalElectricityOthers.toDouble(),
                                width: 20,
                                borderRadius: BorderRadius.circular(2))
                          ]),
                          BarChartGroupData(x: 6, barRods: [
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
            if (state is ElectricityFailureState) {
              return const Padding(
                padding: EdgeInsets.all(8.0),
                child: Center(child: Text("Unable to load electricity data")),
              );
            }
            return const Padding(
              padding: EdgeInsets.all(8.0),
              child: Center(child: Text("Something went wrong")),
            );
          },
        )
      ],
    ));
  }
}
