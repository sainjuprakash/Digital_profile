import 'package:digital_profile/app_localization/l10n.dart';
import 'package:digital_profile/constant/app_texts/app_title_text.dart';
import 'package:digital_profile/constant/spacing.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HouseBarChart extends StatelessWidget {
  int totalKhar;
  int totalJasta;
  int totalStoneTile;
  int totalRcc;
  int totalWood;
  int totalMud;
  int totalOthers;
  int totalNotAvailable;
  int totalWardRoof;

  HouseBarChart(
      this.totalKhar,
      this.totalJasta,
      this.totalStoneTile,
      this.totalRcc,
      this.totalWood,
      this.totalMud,
      this.totalOthers,
      this.totalNotAvailable,
      this.totalWardRoof,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          verticalspace(),
          AppTitleText(text: l10n.houseFacilityTitle),
          verticalspace(),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: SizedBox(
                height: 550,
                width: 800,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: BarChart(BarChartData(
                    minY: 0,
                    maxY: 3000,
                    titlesData: FlTitlesData(
                        show: true,
                        topTitles: const AxisTitles(
                            sideTitles: SideTitles(showTitles: false)),
                        bottomTitles: AxisTitles(
                            sideTitles: SideTitles(
                                showTitles: true,
                                reservedSize: 60,
                                getTitlesWidget: (value, meta) {
                                  final religionLists = [
                                    l10n.khar,
                                    l10n.jasta,
                                    l10n.stoneRoof,
                                    l10n.rcc,
                                    l10n.wood,
                                    l10n.mud,
                                    l10n.others,
                                    l10n.notavailable,
                                  ];
                                  final index = value.toInt();
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(religionLists[index]),
                                  );
                                }))),
                    barGroups: [
                      BarChartGroupData(x: 0, barRods: [
                        BarChartRodData(
                            toY: totalKhar.toDouble(),
                            width: 20,
                            borderRadius: BorderRadius.circular(2))
                      ]),
                    ],
                  )),
                )),
          ),
        ],
      ),
    );
  }
}
