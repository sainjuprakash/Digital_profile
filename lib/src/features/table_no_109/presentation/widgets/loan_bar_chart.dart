import 'package:digital_profile/app_localization/l10n.dart';
import 'package:digital_profile/constant/app_texts/app_title_text.dart';
import 'package:digital_profile/constant/spacing.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/loan_bloc.dart';

class LoanBarChart extends StatelessWidget {
  int totalAgriculture,
      totalBusiness,
      totalHouseExp,
      totalForeignEmp,
      totalEducation,
      totalMedical,
      totalOthers,
      totalNotAvailable,
      totalWardHouses,
      totalLoan;

  LoanBarChart(
      this.totalAgriculture,
      this.totalBusiness,
      this.totalHouseExp,
      this.totalForeignEmp,
      this.totalEducation,
      this.totalMedical,
      this.totalOthers,
      this.totalNotAvailable,
      this.totalWardHouses,
      this.totalLoan,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          verticalspace(),
          AppTitleText(text: l10n.loanTitle),
          verticalspace(),
          BlocBuilder<LoanBloc, LoanState>(
            builder: (context, state) {
              if (state is LoanLoadingState) {
                return const Center(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: CircularProgressIndicator(),
                  ),
                );
              }
              if (state is LoanSuccessState) {
                return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: SizedBox(
                    height: 550,
                    width: 800,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: BarChart(BarChartData(
                          minY: 0,
                          maxY: 3000,
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
                                    l10n.agricultureLoan,
                                    l10n.businessLoan,
                                    l10n.houseExpLoan,
                                    l10n.educationLoan,
                                    l10n.medicalLoan,
                                    l10n.others,
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
                                  toY: totalAgriculture.toDouble(),
                                  width: 20,
                                  borderRadius: BorderRadius.circular(2))
                            ]),
                            BarChartGroupData(x: 1, barRods: [
                              BarChartRodData(
                                  toY: totalBusiness.toDouble(),
                                  width: 20,
                                  borderRadius: BorderRadius.circular(2))
                            ]),
                            BarChartGroupData(x: 2, barRods: [
                              BarChartRodData(
                                  toY: totalHouseExp.toDouble(),
                                  width: 20,
                                  borderRadius: BorderRadius.circular(2))
                            ]),
                            BarChartGroupData(x: 3, barRods: [
                              BarChartRodData(
                                  toY: totalEducation.toDouble(),
                                  width: 20,
                                  borderRadius: BorderRadius.circular(2))
                            ]),
                            BarChartGroupData(x: 4, barRods: [
                              BarChartRodData(
                                  toY: totalMedical.toDouble(),
                                  width: 20,
                                  borderRadius: BorderRadius.circular(2))
                            ]),
                            BarChartGroupData(x: 5, barRods: [
                              BarChartRodData(
                                  toY: totalOthers.toDouble(),
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
              if (state is LoanFailureState) {
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
