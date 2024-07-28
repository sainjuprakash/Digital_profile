import 'package:digital_profile/app_localization/l10n.dart';
import 'package:digital_profile/constant/app_texts/app_title_text.dart';
import 'package:digital_profile/constant/spacing.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/occupation_bloc.dart';

class OccupationBarChart extends StatelessWidget {
  int totalAgriculture,
      totalOffice,
      totalBusiness,
      totalWorker,
      totalEntrepreneur,
      totalForeignEmp,
      totalStudent,
      totalHousewife,
      totalUnemployed,
      totalUnderage,
      totalPension,
      totalTechnical,
      totalSenior,
      totalOthers,
      totalNotAvailable,
      totalOccupation;

  OccupationBarChart(
      this.totalAgriculture,
      this.totalOffice,
      this.totalBusiness,
      this.totalWorker,
      this.totalEntrepreneur,
      this.totalForeignEmp,
      this.totalStudent,
      this.totalHousewife,
      this.totalUnemployed,
      this.totalUnderage,
      this.totalPension,
      this.totalTechnical,
      this.totalSenior,
      this.totalOthers,
      this.totalNotAvailable,
      this.totalOccupation,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          verticalspace(),
          AppTitleText(text: l10n.OccupationTitle),
          BlocBuilder<OccupationBloc, OccupationState>(
            builder: (context, state) {
              if (state is OccupationLoadingState) {
                return const Center(
                    child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: CircularProgressIndicator(),
                ));
              }
              if (state is OccupationSuccessState) {
                return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: SizedBox(
                      height: 550,
                      width: 1500,
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
                                        reservedSize: 50,
                                        getTitlesWidget: (value, meta) {
                                          final residenceRepresentation = [
                                            '${l10n.agriculture}\nपशुपालन',
                                            l10n.office,
                                            l10n.business,
                                            l10n.worker,
                                            '${l10n.entrepreneur}\nकार्य',
                                            '${l10n.foreignEmp}\nरोजगारी',
                                            l10n.student,
                                            l10n.houseWife,
                                            l10n.unemployed,
                                            l10n.underage,
                                            l10n.pension,
                                            l10n.technical,
                                            l10n.seniorCtzn,
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
                                    toY: totalAgriculture.toDouble(),
                                    width: 20,
                                    borderRadius: BorderRadius.circular(2))
                              ]),
                              BarChartGroupData(x: 1, barRods: [
                                BarChartRodData(
                                    toY: totalOffice.toDouble(),
                                    width: 20,
                                    borderRadius: BorderRadius.circular(2))
                              ]),
                              BarChartGroupData(x: 2, barRods: [
                                BarChartRodData(
                                    toY: totalBusiness.toDouble(),
                                    width: 20,
                                    borderRadius: BorderRadius.circular(2))
                              ]),
                              BarChartGroupData(x: 3, barRods: [
                                BarChartRodData(
                                    toY: totalWorker.toDouble(),
                                    width: 20,
                                    borderRadius: BorderRadius.circular(2))
                              ]),
                              BarChartGroupData(x: 4, barRods: [
                                BarChartRodData(
                                    toY: totalEntrepreneur.toDouble(),
                                    width: 20,
                                    borderRadius: BorderRadius.circular(2))
                              ]),
                              BarChartGroupData(x: 5, barRods: [
                                BarChartRodData(
                                    toY: totalForeignEmp.toDouble(),
                                    width: 20,
                                    borderRadius: BorderRadius.circular(2))
                              ]),
                              BarChartGroupData(x: 6, barRods: [
                                BarChartRodData(
                                    toY: totalStudent.toDouble(),
                                    width: 20,
                                    borderRadius: BorderRadius.circular(2))
                              ]),
                              BarChartGroupData(x: 7, barRods: [
                                BarChartRodData(
                                    toY: totalHousewife.toDouble(),
                                    width: 20,
                                    borderRadius: BorderRadius.circular(2))
                              ]),
                              BarChartGroupData(x: 8, barRods: [
                                BarChartRodData(
                                    toY: totalUnemployed.toDouble(),
                                    width: 20,
                                    borderRadius: BorderRadius.circular(2))
                              ]),
                              BarChartGroupData(x: 9, barRods: [
                                BarChartRodData(
                                    toY: totalUnderage.toDouble(),
                                    width: 20,
                                    borderRadius: BorderRadius.circular(2))
                              ]),
                              BarChartGroupData(x: 10, barRods: [
                                BarChartRodData(
                                    toY: totalPension.toDouble(),
                                    width: 20,
                                    borderRadius: BorderRadius.circular(2))
                              ]),
                              BarChartGroupData(x: 11, barRods: [
                                BarChartRodData(
                                    toY: totalTechnical.toDouble(),
                                    width: 20,
                                    borderRadius: BorderRadius.circular(2))
                              ]),
                              BarChartGroupData(x: 12, barRods: [
                                BarChartRodData(
                                    toY: totalSenior.toDouble(),
                                    width: 20,
                                    borderRadius: BorderRadius.circular(2))
                              ]),
                              BarChartGroupData(x: 13, barRods: [
                                BarChartRodData(
                                    toY: totalOthers.toDouble(),
                                    width: 20,
                                    borderRadius: BorderRadius.circular(2))
                              ]),
                              BarChartGroupData(x: 14, barRods: [
                                BarChartRodData(
                                    toY: totalNotAvailable.toDouble(),
                                    width: 20,
                                    borderRadius: BorderRadius.circular(2))
                              ]),
                            ])),
                      )),
                );
              }
              if (state is OccupationFailureState) {
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
