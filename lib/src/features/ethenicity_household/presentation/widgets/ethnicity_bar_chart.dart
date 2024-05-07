import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../app_localization/l10n.dart';
import '../bloc/ethnicity_bloc.dart';

class EthnicityPieChart extends StatelessWidget {
  int? totalMuslim;
  int? totalHillBrahman;
  int? totalTeraiBrahman;
  int? totalHillJanajati;
  int? totalTeraiJanajati;
  int? totalHillDalit;
  int? totalNotAvailable;
  int? totalTotalEthnicity;
  EthnicityPieChart(
      {super.key,
      required this.totalMuslim,
      required this.totalHillBrahman,
      required this.totalTeraiBrahman,
      required this.totalHillJanajati,
      required this.totalTeraiJanajati,
      required this.totalHillDalit,
      required this.totalNotAvailable,
      required this.totalTotalEthnicity});

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        const Text(
          'जातजाती अनुसार घरपरिवार संख्याा',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        BlocBuilder<EthnicityBloc, EthnicityState>(builder: (context, state) {
          if (state is EthnicityLoadingState) {
            return const Center(
                child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: CircularProgressIndicator()));
          }
          if (state is EthnicitySuccessState) {
            //  List<EthnicityModel> fetchedEthnicityData = state.fetchedEthnicityModel;
            return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: SizedBox(
                height: 500,
                width: 700,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: BarChart(BarChartData(
                      alignment: BarChartAlignment.spaceAround,
                      titlesData: FlTitlesData(
                        topTitles: const AxisTitles(
                            sideTitles: SideTitles(showTitles: false)),
                        show: true,
                        bottomTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            reservedSize: 33,
                            getTitlesWidget: (value, meta) {
                              // print(value);
                              // print(meta);
                              final lists = [
                                l10n.hillbrahmen,
                                l10n.teraiBrahman,
                                l10n.hillJanajati,
                                l10n.teraiJanajati,
                                l10n.hillDalit,
                                l10n.muslim,
                                l10n.notavailable
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
                        // rightTitles: const AxisTitles(),
                        // topTitles: const AxisTitles(),
                      ),
                      minY: 0,
                      maxY: 1700,
                      barGroups: [
                        BarChartGroupData(
                          x: 0,
                          barRods: [
                            BarChartRodData(
                                borderRadius: BorderRadius.circular(2),
                                color: const Color(0xFF64B5F6),
                                toY: totalHillBrahman?.toDouble() ?? 0,
                                width: 20),
                          ],
                        ),
                        BarChartGroupData(
                          x: 1,
                          barRods: [
                            BarChartRodData(
                                borderRadius: BorderRadius.circular(2),
                                color: const Color(0xFF64B5F6),
                                toY: totalTeraiBrahman?.toDouble() ?? 0,
                                width: 20),
                          ],
                        ),
                        BarChartGroupData(
                          x: 2,
                          barRods: [
                            BarChartRodData(
                                borderRadius: BorderRadius.circular(2),
                                color: const Color(0xFF64B5F6),
                                toY: totalHillJanajati?.toDouble() ?? 0,
                                width: 20),
                          ],
                        ),
                        BarChartGroupData(
                          x: 3,
                          barRods: [
                            BarChartRodData(
                                borderRadius: BorderRadius.circular(2),
                                color: const Color(0xFF64B5F6),
                                toY: totalTeraiJanajati?.toDouble() ?? 0,
                                width: 20),
                          ],
                        ),
                        BarChartGroupData(
                          x: 4,
                          barRods: [
                            BarChartRodData(
                                borderRadius: BorderRadius.circular(2),
                                color: const Color(0xFF64B5F6),
                                toY: totalHillDalit?.toDouble() ?? 0,
                                width: 20),
                          ],
                        ),
                        BarChartGroupData(
                          x: 5,
                          barRods: [
                            BarChartRodData(
                                borderRadius: BorderRadius.circular(2),
                                color: const Color(0xFF64B5F6),
                                toY: totalMuslim?.toDouble() ?? 0,
                                width: 20),
                          ],
                        ),
                        BarChartGroupData(
                          x: 6,
                          barRods: [
                            BarChartRodData(
                                borderRadius: BorderRadius.circular(2),
                                color: const Color(0xFF64B5F6),
                                toY: totalNotAvailable?.toDouble() ?? 0,
                                width: 20),
                          ],
                        ),
                      ])),
                ),
              ),
            );
          }
          if (state is EthnicityFailureState) {
            return const Padding(
              padding: EdgeInsets.all(8.0),
              child: Center(child: Text('Unable to load ethnicity data')),
            );
          }
          return const Padding(
            padding: EdgeInsets.all(8.0),
            child: Center(child: Text('Something went wrong')),
          );
        }),
      ],
    ));
  }
}
