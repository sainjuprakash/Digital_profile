import 'package:digital_profile/app_localization/l10n.dart';
import 'package:digital_profile/constant/app_texts/app_title_text.dart';
import 'package:digital_profile/constant/spacing.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/house_ownership_bloc.dart';

class HouseOwnershipBarChart extends StatelessWidget {
  int totalPersonal;
  int totalRental;
  int totalOrganizational;
  int totalSukumbasi;
  int totalOthers;
  int totalNotAvailable;
  int totalOwnerShip;

  HouseOwnershipBarChart(
      this.totalPersonal,
      this.totalRental,
      this.totalOrganizational,
      this.totalSukumbasi,
      this.totalOthers,
      this.totalNotAvailable,
      this.totalOwnerShip,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          verticalspace(),
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: AppTitleText(text: l10n.houseOwnershipTitle),
          ),
          verticalspace(),
          BlocBuilder<HouseOwnershipBloc, HouseOwnershipState>(
            builder: (context, state) {
              if (state is HouseOwnershipLoadingState) {
                return const Center(
                    child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: CircularProgressIndicator(),
                ));
              }
              if (state is HouseOwnershipSuccessState) {
                return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: SizedBox(
                      height: 550,
                      width: 800,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: BarChart(BarChartData(
                            alignment: BarChartAlignment.spaceAround,
                            minY: 0,
                            maxY: 3000,
                            titlesData: FlTitlesData(
                                topTitles: const AxisTitles(
                                    sideTitles: SideTitles(showTitles: false)),
                                bottomTitles: AxisTitles(
                                    sideTitles: SideTitles(
                                        showTitles: true,
                                        reservedSize: 35,
                                        getTitlesWidget: (value, meta) {
                                          final residenceRepresentation = [
                                            l10n.personal,
                                            l10n.rental,
                                            l10n.organizational,
                                            l10n.sukumbasi,
                                            l10n.others,
                                            l10n.notavailable,
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
                                    toY: totalPersonal.toDouble(),
                                    width: 20,
                                    borderRadius: BorderRadius.circular(2)),
                              ]),
                              BarChartGroupData(x: 1, barRods: [
                                BarChartRodData(
                                    toY: totalRental.toDouble(),
                                    width: 20,
                                    borderRadius: BorderRadius.circular(2)),
                              ]),
                              BarChartGroupData(x: 2, barRods: [
                                BarChartRodData(
                                    toY: totalOrganizational.toDouble(),
                                    width: 20,
                                    borderRadius: BorderRadius.circular(2)),
                              ]),
                              BarChartGroupData(x: 3, barRods: [
                                BarChartRodData(
                                    toY: totalSukumbasi.toDouble(),
                                    width: 20,
                                    borderRadius: BorderRadius.circular(2)),
                              ]),
                              BarChartGroupData(x: 4, barRods: [
                                BarChartRodData(
                                    toY: totalOthers.toDouble(),
                                    width: 20,
                                    borderRadius: BorderRadius.circular(2)),
                              ]),
                              BarChartGroupData(x: 5, barRods: [
                                BarChartRodData(
                                    toY: totalNotAvailable.toDouble(),
                                    width: 20,
                                    borderRadius: BorderRadius.circular(2)),
                              ]),
                            ])),
                      )),
                );
              }
              if (state is HouseOwnershipFailureState) {
                return const Center(
                    child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Unable to load data'),
                ));
              }
              return const Center(
                  child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('Something went wrong'),
              ));
            },
          )
        ],
      ),
    );
  }
}
