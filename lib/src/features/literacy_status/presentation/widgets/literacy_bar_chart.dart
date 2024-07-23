import 'package:digital_profile/app_localization/l10n.dart';
import 'package:digital_profile/constant/app_texts/app_title_text.dart';
import 'package:digital_profile/constant/spacing.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/literacy_bloc.dart';

class LiteracyBarChart extends StatelessWidget {
  int totalLiterate,
      totalPrePrimary,
      totalPrimary,
      totalSecondary,
      totalTechnical,
      totalBachelor,
      totalMaster,
      totalMphil,
      totalUnderAge,
      totalIlliterate,
      totalNotAvailable,
      totalMaleLiterate,
      totalMalePrePrimary,
      totalMalePrimary,
      totalMaleSecondary,
      totalMaleTechnical,
      totalMaleBachelor,
      totalMaleMaster,
      totalMaleMphil,
      totalMaleUnderAge,
      totalMaleIlliterate,
      totalMaleNotAvailable,
      totalFemaleLiterate,
      totalFemalePrePrimary,
      totalFemalePrimary,
      totalFemaleSecondary,
      totalFemaleTechnical,
      totalFemaleBachelor,
      totalFemaleMaster,
      totalFemaleMphil,
      totalFemaleUnderAge,
      totalFemaleIlliterate,
      totalFemaleNotAvailable,
      totalVillageEduCount;

  LiteracyBarChart(
      this.totalLiterate,
      this.totalPrePrimary,
      this.totalPrimary,
      this.totalSecondary,
      this.totalTechnical,
      this.totalBachelor,
      this.totalMaster,
      this.totalMphil,
      this.totalUnderAge,
      this.totalIlliterate,
      this.totalNotAvailable,
      this.totalMaleLiterate,
      this.totalMalePrePrimary,
      this.totalMalePrimary,
      this.totalMaleSecondary,
      this.totalMaleTechnical,
      this.totalMaleBachelor,
      this.totalMaleMaster,
      this.totalMaleMphil,
      this.totalMaleUnderAge,
      this.totalMaleIlliterate,
      this.totalMaleNotAvailable,
      this.totalFemaleLiterate,
      this.totalFemalePrePrimary,
      this.totalFemalePrimary,
      this.totalFemaleSecondary,
      this.totalFemaleTechnical,
      this.totalFemaleBachelor,
      this.totalFemaleMaster,
      this.totalFemaleMphil,
      this.totalFemaleUnderAge,
      this.totalFemaleIlliterate,
      this.totalFemaleNotAvailable,
      this.totalVillageEduCount,
      {super.key});

  final List<Color> _colorsMaleFemale = [
    Colors.blueAccent,
    Colors.deepPurple,
    const Color(0xFF3F51B5)
  ];
  final List<String> _representations = [l10n.total, l10n.male, l10n.female];

  @override
  Widget build(BuildContext context) {
    final List<Padding> containeers = List.generate(3, (index) {
      return Padding(
        padding: const EdgeInsets.only(right: 40.0),
        child: Row(
          children: [
            Container(
              height: 17,
              width: 17,
              color: _colorsMaleFemale[index],
              margin: const EdgeInsets.all(5),
            ),
            Text(_representations[index]),
          ],
        ),
      );
    });
    return Card(
      child: Column(
        children: [
          verticalspace(),
          AppTitleText(text: l10n.literacytitle),
          verticalspace(),
          BlocBuilder<LiteracyBloc, LiteracyState>(
            builder: (context, state) {
              if (state is LiteracyLoadingState) {
                return const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Center(child: CircularProgressIndicator()),
                );
              }
              if (state is LiteracySuccessState) {
                return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: SizedBox(
                    height: 550,
                    width: 1400,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: BarChart(BarChartData(
                          alignment: BarChartAlignment.spaceAround,
                          minY: 0,
                          maxY: 15000,
                          titlesData: FlTitlesData(
                              topTitles: const AxisTitles(
                                  sideTitles: SideTitles(showTitles: false)),
                              bottomTitles: AxisTitles(
                                  sideTitles: SideTitles(
                                      showTitles: true,
                                      reservedSize: 35,
                                      getTitlesWidget: (value, meta) {
                                        final residenceRepresentation = [
                                          l10n.literate,
                                          l10n.preprimary,
                                          l10n.primary,
                                          l10n.secondary,
                                          l10n.technical,
                                          l10n.bachelor,
                                          l10n.master,
                                          l10n.mphil,
                                          l10n.underage,
                                          l10n.illiterate,
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
                                  toY: totalLiterate.toDouble(),
                                  width: 20,
                                  borderRadius: BorderRadius.circular(2),
                                  color: Colors.blueAccent),
                              BarChartRodData(
                                  toY: totalMaleLiterate.toDouble(),
                                  width: 20,
                                  borderRadius: BorderRadius.circular(2),
                                  color: Colors.deepPurple),
                              BarChartRodData(
                                  toY: totalFemaleLiterate.toDouble(),
                                  width: 20,
                                  borderRadius: BorderRadius.circular(2),
                                  color: const Color(0xFF3F51B5))
                            ]),
                            BarChartGroupData(x: 1, barRods: [
                              BarChartRodData(
                                  toY: totalPrePrimary.toDouble(),
                                  width: 20,
                                  borderRadius: BorderRadius.circular(2),
                                  color: Colors.blueAccent),
                              BarChartRodData(
                                  toY: totalMalePrePrimary.toDouble(),
                                  width: 20,
                                  borderRadius: BorderRadius.circular(2),
                                  color: Colors.deepPurple),
                              BarChartRodData(
                                  toY: totalFemalePrePrimary.toDouble(),
                                  width: 20,
                                  borderRadius: BorderRadius.circular(2),
                                  color: const Color(0xFF3F51B5))
                            ]),
                            BarChartGroupData(x: 2, barRods: [
                              BarChartRodData(
                                  toY: totalPrimary.toDouble(),
                                  width: 20,
                                  borderRadius: BorderRadius.circular(2),
                                  color: Colors.blueAccent),
                              BarChartRodData(
                                  toY: totalMalePrimary.toDouble(),
                                  width: 20,
                                  borderRadius: BorderRadius.circular(2),
                                  color: Colors.deepPurple),
                              BarChartRodData(
                                  toY: totalFemalePrimary.toDouble(),
                                  width: 20,
                                  borderRadius: BorderRadius.circular(2),
                                  color: const Color(0xFF3F51B5))
                            ]),
                            BarChartGroupData(x: 3, barRods: [
                              BarChartRodData(
                                  toY: totalSecondary.toDouble(),
                                  width: 20,
                                  borderRadius: BorderRadius.circular(2),
                                  color: Colors.blueAccent),
                              BarChartRodData(
                                  toY: totalMaleSecondary.toDouble(),
                                  width: 20,
                                  borderRadius: BorderRadius.circular(2),
                                  color: Colors.deepPurple),
                              BarChartRodData(
                                  toY: totalFemaleSecondary.toDouble(),
                                  width: 20,
                                  borderRadius: BorderRadius.circular(2),
                                  color: const Color(0xFF3F51B5))
                            ]),
                            BarChartGroupData(x: 4, barRods: [
                              BarChartRodData(
                                  toY: totalTechnical.toDouble(),
                                  width: 20,
                                  borderRadius: BorderRadius.circular(2),
                                  color: Colors.blueAccent),
                              BarChartRodData(
                                  toY: totalMaleTechnical.toDouble(),
                                  width: 20,
                                  borderRadius: BorderRadius.circular(2),
                                  color: Colors.deepPurple),
                              BarChartRodData(
                                  toY: totalFemaleTechnical.toDouble(),
                                  width: 20,
                                  borderRadius: BorderRadius.circular(2),
                                  color: const Color(0xFF3F51B5))
                            ]),
                            BarChartGroupData(x: 5, barRods: [
                              BarChartRodData(
                                  toY: totalBachelor.toDouble(),
                                  width: 20,
                                  borderRadius: BorderRadius.circular(2),
                                  color: Colors.blueAccent),
                              BarChartRodData(
                                  toY: totalMaleBachelor.toDouble(),
                                  width: 20,
                                  borderRadius: BorderRadius.circular(2),
                                  color: Colors.deepPurple),
                              BarChartRodData(
                                  toY: totalFemaleBachelor.toDouble(),
                                  width: 20,
                                  borderRadius: BorderRadius.circular(2),
                                  color: const Color(0xFF3F51B5))
                            ]),
                            BarChartGroupData(x: 6, barRods: [
                              BarChartRodData(
                                  toY: totalMaster.toDouble(),
                                  width: 20,
                                  borderRadius: BorderRadius.circular(2),
                                  color: Colors.blueAccent),
                              BarChartRodData(
                                  toY: totalMaleMaster.toDouble(),
                                  width: 20,
                                  borderRadius: BorderRadius.circular(2),
                                  color: Colors.deepPurple),
                              BarChartRodData(
                                  toY: totalFemaleMaster.toDouble(),
                                  width: 20,
                                  borderRadius: BorderRadius.circular(2),
                                  color: const Color(0xFF3F51B5))
                            ]),
                            BarChartGroupData(x: 7, barRods: [
                              BarChartRodData(
                                  toY: totalMphil.toDouble(),
                                  width: 20,
                                  borderRadius: BorderRadius.circular(2),
                                  color: Colors.blueAccent),
                              BarChartRodData(
                                  toY: totalMaleMphil.toDouble(),
                                  width: 20,
                                  borderRadius: BorderRadius.circular(2),
                                  color: Colors.deepPurple),
                              BarChartRodData(
                                  toY: totalFemaleMphil.toDouble(),
                                  width: 20,
                                  borderRadius: BorderRadius.circular(2),
                                  color: const Color(0xFF3F51B5))
                            ]),
                            BarChartGroupData(x: 8, barRods: [
                              BarChartRodData(
                                  toY: totalUnderAge.toDouble(),
                                  width: 20,
                                  borderRadius: BorderRadius.circular(2),
                                  color: Colors.blueAccent),
                              BarChartRodData(
                                  toY: totalMaleUnderAge.toDouble(),
                                  width: 20,
                                  borderRadius: BorderRadius.circular(2),
                                  color: Colors.deepPurple),
                              BarChartRodData(
                                  toY: totalFemaleUnderAge.toDouble(),
                                  width: 20,
                                  borderRadius: BorderRadius.circular(2),
                                  color: const Color(0xFF3F51B5))
                            ]),
                            BarChartGroupData(x: 9, barRods: [
                              BarChartRodData(
                                  toY: totalIlliterate.toDouble(),
                                  width: 20,
                                  borderRadius: BorderRadius.circular(2),
                                  color: Colors.blueAccent),
                              BarChartRodData(
                                  toY: totalMaleIlliterate.toDouble(),
                                  width: 20,
                                  borderRadius: BorderRadius.circular(2),
                                  color: Colors.deepPurple),
                              BarChartRodData(
                                  toY: totalFemaleIlliterate.toDouble(),
                                  width: 20,
                                  borderRadius: BorderRadius.circular(2),
                                  color: const Color(0xFF3F51B5))
                            ]),
                            BarChartGroupData(x: 10, barRods: [
                              BarChartRodData(
                                  toY: totalNotAvailable.toDouble(),
                                  width: 20,
                                  borderRadius: BorderRadius.circular(2),
                                  color: Colors.blueAccent),
                              BarChartRodData(
                                  toY: totalMaleNotAvailable.toDouble(),
                                  width: 20,
                                  borderRadius: BorderRadius.circular(2),
                                  color: Colors.deepPurple),
                              BarChartRodData(
                                  toY: totalFemaleUnderAge.toDouble(),
                                  width: 20,
                                  borderRadius: BorderRadius.circular(2),
                                  color: const Color(0xFF3F51B5))
                            ]),
                          ])),
                    ),
                  ),
                );
              }
              if (state is LiteracyFailureState) {
                return const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Unable to load data'),
                );
              }
              return const Padding(
                padding: EdgeInsets.all(8.0),
                child: Center(child: Text('Something went wrong')),
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.only(left: 38.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: containeers,
            ),
          ),
        ],
      ),
    );
  }
}
