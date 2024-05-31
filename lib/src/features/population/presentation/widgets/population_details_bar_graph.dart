import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/population_model.dart';
import '../bloc/population_bloc.dart';
import 'dart:math' as math;

class PopulationBarGraph extends StatefulWidget {
  const PopulationBarGraph({super.key});

  @override
  State<PopulationBarGraph> createState() => _PopulationBarGraphState();
}

class _PopulationBarGraphState extends State<PopulationBarGraph> {

  int touchedGroupIndex = -1;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PopulationBloc, PopulationState>(
        builder: (context, state) {
      if (state is PopulationSuccessState) {
        List<PopulationModel>? populationData = state.populationModel;
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: SizedBox(
            height: 550,
            width: 650,
            child: Padding(
              padding: const EdgeInsets.only(
                top: 10.0,
              ),
              child: BarChart(BarChartData(
                alignment: BarChartAlignment.spaceAround,
                minY: 0,
                maxY: 2000,
                barGroups: populationData
                    .map((e) => BarChartGroupData(
                            x: (e.surveyWardNumber) ?? 0,
                            barRods: [
                              BarChartRodData(
                                toY: e.maleCount?.toDouble() ?? 0,
                                // toY: loadedPopulationData[index]
                                //     .maleCount,
                                width: 20,

                                borderRadius: BorderRadius.circular(2),
                                color: const Color(0xFF1976D2),
                                //fromY: 20,
                                //borderDashArray: [5, 10],
                              ),
                              BarChartRodData(
                                toY: e.femaleCount?.toDouble() ?? 0,
                                // toY: loadedPopulationData[index]
                                //     .maleCount,
                                width: 20,
                                borderRadius: BorderRadius.circular(2),
                                color: const Color(0xFF64B5F6),
                                //fromY: 20,
                                //borderDashArray: [5, 10],
                              ),
                              BarChartRodData(
                                toY: e.othersCount?.toDouble() ?? 0,
                                // toY: loadedPopulationData[index]
                                //     .maleCount,
                                width: 20,
                                borderRadius: BorderRadius.circular(2),
                                color: const Color(0xFF2196F3),
                                //fromY: 20,
                                //borderDashArray: [5, 10],
                              ),
                            ]))
                    .toList(),
              )),
            ),
          ),
        );
      } else if (state is PopulationLoadingState) {
        return const Center(
            child: Padding(
          padding: EdgeInsets.all(20.0),
          child: CircularProgressIndicator(),
        ));
      } else if (state is PopulationFailureState) {
        return const Center(
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Text("Unable to load data"),
          ),
        );
      }
      return const Padding(
        padding: EdgeInsets.all(20.0),
        child: Text("Something went wrong"),
      );
    });

  }
}
