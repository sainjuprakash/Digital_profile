import 'package:digital_profile/app_localization/l10n.dart';
import 'package:digital_profile/constant/app_texts/app_title_text.dart';
import 'package:digital_profile/constant/spacing.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/settlement_bloc.dart';

class SettlementBarChart extends StatelessWidget {
  int totalPermanent, totalTemporary, totalOthers, totalResidence;

  SettlementBarChart(this.totalPermanent, this.totalTemporary, this.totalOthers,
      this.totalResidence,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          verticalspace(),
          AppTitleText(text: l10n.settlementTitle),
          BlocBuilder<SettlementBloc, SettlementState>(
            builder: (context, state) {
              if (state is SettlementLoadingState) {
                return const Center(
                    child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: CircularProgressIndicator(),
                ));
              }
              if (state is SettlementSuccessState) {
                return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: SizedBox(
                      height: 550,
                      width:500,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: BarChart(BarChartData(
                            alignment: BarChartAlignment.spaceAround,
                            minY: 0,
                            maxY: 5000,
                            titlesData: FlTitlesData(
                              topTitles: const AxisTitles(
                                  sideTitles: SideTitles(showTitles: false)),
                              show: true,
                              bottomTitles: AxisTitles(
                                sideTitles: SideTitles(
                                  showTitles: true,
                                  reservedSize: 35,
                                  getTitlesWidget: (value, meta) {
                                    final lists = [
                                      l10n.permanent,
                                      l10n.temporary,
                                      l10n.others,
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
                                    toY: totalPermanent.toDouble(),
                                    width: 20,
                                    borderRadius: BorderRadius.circular(2))
                              ]),
                              BarChartGroupData(x: 1, barRods: [
                                BarChartRodData(
                                    toY: totalTemporary.toDouble(),
                                    width: 20,
                                    borderRadius: BorderRadius.circular(2))
                              ]),
                              BarChartGroupData(x: 0, barRods: [
                                BarChartRodData(
                                    toY: totalOthers.toDouble(),
                                    width: 20,
                                    borderRadius: BorderRadius.circular(2))
                              ]),
                            ])),
                      )),
                );
              }
              if (state is SettlementFailureState) {
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
