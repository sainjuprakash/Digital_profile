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
                      padding: const EdgeInsets.only(top: 8.0,bottom: 40),
                      child: SizedBox(
                          height: 250,
                          width: 250,
                          child: PieChart(
                              swapAnimationDuration:
                                  const Duration(milliseconds: 300),
                              PieChartData(
                                  sections: [
                                PieChartSectionData(
                                    color: const Color(0xFF009688),
                                    value: totalBirds.toDouble(),
                                    badgeWidget: Text(l10n.birds),
                                    badgePositionPercentageOffset: 1.5),
                                PieChartSectionData(
                                    color: const Color(0xFF1976D2),
                                    value: totalLiveStock.toDouble(),
                                    badgeWidget: Text(l10n.livestock),
                                    badgePositionPercentageOffset: 1.5),
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
