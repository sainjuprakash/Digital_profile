import 'package:digital_profile/app_localization/l10n.dart';
import 'package:digital_profile/constant/app_texts/app_title_text.dart';
import 'package:digital_profile/constant/spacing.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/bank_account_bloc.dart';

class BankAccountBarChart extends StatelessWidget {
  int totalDevBank,
      totalCommercialBank,
      totalSahakari,
      totalBitiyaSanstha,
      totalNotAvailable,
      totalTotal;

  BankAccountBarChart(
      this.totalDevBank,
      this.totalCommercialBank,
      this.totalSahakari,
      this.totalBitiyaSanstha,
      this.totalNotAvailable,
      this.totalTotal,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          verticalspace(),
          AppTitleText(text: l10n.bankTitle),
          BlocBuilder<BankAccountBloc, BankAccountState>(
            builder: (context, state) {
              if (state is BankAccountLoadingState) {
                return const Center(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: CircularProgressIndicator(),
                  ),
                );
              }
              if (state is BankAccountSuccessState) {
                return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: SizedBox(
                      height: 550,
                      width: 700,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: BarChart(BarChartData(
                            minY: 0,
                            maxY: 5000,
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
                                      l10n.devBank,
                                      l10n.commercialBank,
                                      l10n.bittiyaSanstha,
                                      l10n.sahakari,
                                      l10n.Undisclosed,
                                    ];
                                    final index = value.toInt();
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
                                    toY: totalDevBank.toDouble(),
                                    width: 20,
                                    borderRadius: BorderRadius.circular(2))
                              ]),
                              BarChartGroupData(x: 1, barRods: [
                                BarChartRodData(
                                    toY: totalCommercialBank.toDouble(),
                                    width: 20,
                                    borderRadius: BorderRadius.circular(2))
                              ]),
                              BarChartGroupData(x: 2, barRods: [
                                BarChartRodData(
                                    toY: totalBitiyaSanstha.toDouble(),
                                    width: 20,
                                    borderRadius: BorderRadius.circular(2))
                              ]),
                              BarChartGroupData(x: 3, barRods: [
                                BarChartRodData(
                                    toY: totalSahakari.toDouble(),
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
                      )),
                );
              }
              if (state is BankAccountFailureState) {
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
