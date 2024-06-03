import 'package:digital_profile/app_localization/l10n.dart';
import 'package:digital_profile/constant/app_texts/app_title_text.dart';
import 'package:digital_profile/constant/spacing.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BankBarChart extends StatelessWidget {
  int totalHasBankAccount, totalHasNotBankAccount, totalHouses, totalBankAcc;
  BankBarChart(this.totalHasBankAccount, this.totalHasNotBankAccount,
      this.totalHouses, this.totalBankAcc,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          verticalspace(),
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: AppTitleText(text: l10n.bankTitle),
          ),
          verticalspace(),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: SizedBox(
                height: 550,
                width: 600,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: BarChart(BarChartData(
                      minY: 0,
                      maxY: 4000,
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

                                      l10n.hasbankAc,
                                      l10n.noBankAc,
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
                              toY: totalHasBankAccount.toDouble(),
                              width: 20,
                              borderRadius: BorderRadius.circular(2))
                        ]),
                        BarChartGroupData(x: 1, barRods: [
                          BarChartRodData(
                              toY: totalHasNotBankAccount.toDouble(),
                              width: 20,
                              borderRadius: BorderRadius.circular(2))
                        ]),
                        BarChartGroupData(x: 2, barRods: [
                          BarChartRodData(
                              toY: (totalHouses-totalBankAcc).toDouble(),
                              width: 20,
                              borderRadius: BorderRadius.circular(2))
                        ]),
                      ])),
                )),
          )
        ],
      ),
    );
  }
}
