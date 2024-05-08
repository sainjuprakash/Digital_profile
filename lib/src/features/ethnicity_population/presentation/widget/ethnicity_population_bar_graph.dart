import 'package:digital_profile/src/features/ethnicity_population/data/repository/ethnicity_population_repository_impl.dart';
import 'package:digital_profile/src/features/ethnicity_population/presentation/bloc/ethnicity_population_bloc.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../app_localization/l10n.dart';
import '../../data/model/ethnicity_population.dart';

class EthnicityPopulationBarChart extends StatelessWidget {
  int? totalMuslim;
  int? totalHillBrahman;
  int? totalTeraiBrahman;
  int? totalHillJanajati;
  int? totalTeraiJanajati;
  int? totalHillDalit;
  int? totalOthersCount;
  int? totalNotAvailable;
  int? totalWardEthnicity;

  EthnicityPopulationBarChart(
      {super.key,
      required this.totalMuslim,
      required this.totalHillBrahman,
      required this.totalTeraiBrahman,
      required this.totalHillJanajati,
      required this.totalTeraiJanajati,
      required this.totalHillDalit,
      required this.totalOthersCount,
      required this.totalNotAvailable,
      required this.totalWardEthnicity});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          const Center(
            child: Text(
              'जातजाती अनुसार जनसंख्या',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
          BlocBuilder<EthnicityPopulationBloc, EthnicityPopulationState>(
              builder: (context, state) {
            if (state is EthnicityPopulationLoadingState) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is EthnicityPopulationSuccessState) {
              //print(totalHillJanajati);
              return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: SizedBox(
                    height: 500,
                    width: 850,
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
                              reservedSize: 39,
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
                                  l10n.notavailable,
                                  l10n.others,
                                  l10n.totalwardethnicity
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
                        maxY: 8000,
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
                          BarChartGroupData(
                            x: 7,
                            barRods: [
                              BarChartRodData(
                                  borderRadius: BorderRadius.circular(2),
                                  color: const Color(0xFF64B5F6),
                                  toY: totalOthersCount?.toDouble() ?? 0,
                                  width: 20),
                            ],
                          ),
                          BarChartGroupData(
                            x: 8,
                            barRods: [
                              BarChartRodData(
                                  borderRadius: BorderRadius.circular(2),
                                  color: const Color(0xFF64B5F6),
                                  toY: totalWardEthnicity?.toDouble() ?? 0,
                                  width: 20),
                            ],
                          ),
                        ],
                      )),
                    )),
              );
            }
            if (state is EthnicityPopulationFailureState) {
              return const Padding(
                padding: EdgeInsets.all(8.0),
                child: Center(
                    child: Text('Unable to load ethnicity population data')),
              );
            }
            return const Padding(
              padding: EdgeInsets.all(8.0),
              child: Center(child: Text('Something went wrong')),
            );
          }),
        ],
      ),
    );
  }
}
