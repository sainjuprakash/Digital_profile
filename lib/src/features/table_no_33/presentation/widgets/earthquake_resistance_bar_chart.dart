import 'package:digital_profile/app_localization/l10n.dart';
import 'package:digital_profile/constant/app_texts/app_title_text.dart';
import 'package:digital_profile/constant/spacing.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class EarthquakeResistanceBarChart extends StatelessWidget {
  int totalResistance, totalNotResistance, totalResistanceData;
  EarthquakeResistanceBarChart(
      this.totalResistance, this.totalNotResistance, this.totalResistanceData,
      {super.key});
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          verticalspace(),
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: AppTitleText(text: l10n.earthquakeResistanceTitle),
          ),
          verticalspace(),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: SizedBox(
                height: 550,
                width: 400,
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
                                      l10n.resistance,
                                      l10n.notResistance,
                                    ];
                                    int index = value.toInt();
                                    return Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child:
                                          Text(residenceRepresentation[index]),
                                    );
                                  }))),
                      barGroups: [
                        BarChartGroupData(x: 0, barRods: [
                          BarChartRodData(
                              toY: totalResistance.toDouble(),
                              width: 20,
                              borderRadius: BorderRadius.circular(2))
                        ]),
                        BarChartGroupData(x: 1, barRods: [
                          BarChartRodData(
                              toY: totalNotResistance.toDouble(),
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
