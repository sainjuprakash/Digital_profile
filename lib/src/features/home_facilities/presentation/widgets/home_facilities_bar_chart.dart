import 'package:digital_profile/app_localization/l10n.dart';
import 'package:digital_profile/constant/app_texts/app_title_text.dart';
import 'package:digital_profile/constant/spacing.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/home_facilities_bloc.dart';

class HomeFacilitiesBarChart extends StatelessWidget {
  int totalRadio;
  int totalTelevision;
  int totalTelephone;
  int totalComputer;
  int totalInternet;
  int totalMotorcycle;
  int totalCar;
  int totalRefrigerator;
  int totalBus;
  int totalNone;
  int totalWardHouse;
  int totalAminity;

  HomeFacilitiesBarChart(
      this.totalRadio,
      this.totalTelevision,
      this.totalTelephone,
      this.totalComputer,
      this.totalInternet,
      this.totalMotorcycle,
      this.totalCar,
      this.totalRefrigerator,
      this.totalBus,
      this.totalNone,
      this.totalWardHouse,
      this.totalAminity,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          verticalspace(),
          AppTitleText(text: l10n.homeFacilitiesTitle),
          verticalspace(),
          BlocBuilder<HomeFacilitiesBloc, HomeFacilitiesState>(
            builder: (context, state) {
              if (state is HomeFacilitiesLoadingState) {
                return const Center(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: CircularProgressIndicator(),
                  ),
                );
              }
              if (state is HomeFacilitiesSuccessState) {
                return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: 550,
                      width: 1050,
                      child: BarChart(BarChartData(
                          alignment: BarChartAlignment.spaceAround,
                          minY: 0,
                          maxY: 4000,
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
                                    l10n.radio,
                                    l10n.television,
                                    l10n.telephone,
                                    l10n.computer,
                                    l10n.internet,
                                    l10n.motorcycle,
                                    l10n.car,
                                    l10n.refrigerator,
                                    l10n.bus,
                                    l10n.none
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
                                  toY: totalRadio.toDouble(),
                                  width: 20,
                                  borderRadius: BorderRadius.circular(2))
                            ]),
                            BarChartGroupData(x: 1, barRods: [
                              BarChartRodData(
                                  toY: totalTelevision.toDouble(),
                                  width: 20,
                                  borderRadius: BorderRadius.circular(2))
                            ]),
                            BarChartGroupData(x: 2, barRods: [
                              BarChartRodData(
                                  toY: totalTelephone.toDouble(),
                                  width: 20,
                                  borderRadius: BorderRadius.circular(2))
                            ]),
                            BarChartGroupData(x: 3, barRods: [
                              BarChartRodData(
                                  toY: totalComputer.toDouble(),
                                  width: 20,
                                  borderRadius: BorderRadius.circular(2))
                            ]),
                            BarChartGroupData(x: 4, barRods: [
                              BarChartRodData(
                                  toY: totalInternet.toDouble(),
                                  width: 20,
                                  borderRadius: BorderRadius.circular(2))
                            ]),
                            BarChartGroupData(x: 5, barRods: [
                              BarChartRodData(
                                  toY: totalMotorcycle.toDouble(),
                                  width: 20,
                                  borderRadius: BorderRadius.circular(2))
                            ]),
                            BarChartGroupData(x: 6, barRods: [
                              BarChartRodData(
                                  toY: totalCar.toDouble(),
                                  width: 20,
                                  borderRadius: BorderRadius.circular(2))
                            ]),
                            BarChartGroupData(x: 7, barRods: [
                              BarChartRodData(
                                  toY: totalRefrigerator.toDouble(),
                                  width: 20,
                                  borderRadius: BorderRadius.circular(2))
                            ]),
                            BarChartGroupData(x: 8, barRods: [
                              BarChartRodData(
                                  toY: totalBus.toDouble(),
                                  width: 20,
                                  borderRadius: BorderRadius.circular(2))
                            ]),
                            BarChartGroupData(x: 9, barRods: [
                              BarChartRodData(
                                  toY: totalNone.toDouble(),
                                  width: 20,
                                  borderRadius: BorderRadius.circular(2))
                            ]),
                          ])),
                    ),
                  ),
                );
              }
              if (state is HomeFacilitiesFailureState) {
                return const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Center(child: Text("Unable to load data")),
                );
              }
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
