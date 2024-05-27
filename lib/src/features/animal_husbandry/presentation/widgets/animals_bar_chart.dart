import 'package:digital_profile/app_localization/l10n.dart';
import 'package:digital_profile/constant/app_texts/app_title_text.dart';
import 'package:digital_profile/constant/spacing.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/animals_bloc.dart';

class AnimalBarChart extends StatelessWidget {
  int totalHouses;
  int totalBirds;
  int totalLiveStock;
  int totalNoAnimals;

  AnimalBarChart(this.totalBirds, this.totalLiveStock, this.totalHouses,
      this.totalNoAnimals,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          verticalspace(),
          Padding(
            padding: const EdgeInsets.only(left: 12.0),
            child: AppTitleText(text: l10n.animalsTitle),
          ),
          verticalspace(),
          BlocBuilder<AnimalsBloc, AnimalsState>(
            builder: (context, state) {
              if (state is AnimalsLoadingState) {
                return const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Center(child: CircularProgressIndicator()),
                );
              }

              if (state is AnimalsSuccessState) {
                return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                        height: 550,
                        width: 500,
                        child: BarChart(BarChartData(
                            minY: 0,
                            maxY: 2000,
                            alignment: BarChartAlignment.spaceAround,
                            titlesData: FlTitlesData(
                                topTitles: const AxisTitles(
                                    sideTitles: SideTitles(showTitles: false)),
                                bottomTitles: AxisTitles(
                                    sideTitles: SideTitles(
                                        showTitles: true,
                                        reservedSize: 36,
                                        getTitlesWidget: (value, meta) {
                                          final animalList = [
                                            l10n.birds,
                                            l10n.animals,
                                            l10n.noAnimals
                                          ];
                                          int index = value.toInt();
                                          return Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(animalList[index]),
                                          );
                                        }))),
                            barGroups: [
                              BarChartGroupData(x: 0, barRods: [
                                BarChartRodData(
                                    toY: totalBirds.toDouble(),
                                    width: 20,
                                    borderRadius: BorderRadius.circular(2))
                              ]),
                              BarChartGroupData(x: 1, barRods: [
                                BarChartRodData(
                                    toY: totalLiveStock.toDouble(),
                                    width: 20,
                                    borderRadius: BorderRadius.circular(2))
                              ]),
                              BarChartGroupData(x: 2, barRods: [
                                BarChartRodData(
                                    toY: totalNoAnimals.toDouble(),
                                    width: 20,
                                    borderRadius: BorderRadius.circular(2))
                              ]),
                            ]))),
                  ),
                );
              }
              if (state is AnimalsFailureState) {
                return const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Center(child: Text('Unable to load data')),
                );
              }
              return const Padding(
                padding: EdgeInsets.all(8.0),
                child: Center(child: Text('Something went wrong')),
              );
            },
          )
        ],
      ),
    );
  }
}
