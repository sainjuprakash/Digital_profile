import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/population_model.dart';
import '../bloc/population_bloc.dart';

class HouseHoldDetails extends StatefulWidget {
  const HouseHoldDetails({super.key});

  @override
  State<HouseHoldDetails> createState() => _HouseHoldDetailsState();
}

class _HouseHoldDetailsState extends State<HouseHoldDetails> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PopulationBloc, PopulationState>(
        builder: (context, state) {
      if (state is PopulationLoadingState) {
        return const CircularProgressIndicator();
      } else if (state is PopulationSuccessState) {
        List<PopulationModel>? populationData = state.populationModel;
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: SizedBox(
            height: 400,
            width: 500,
            child: Padding(
              padding: const EdgeInsets.only(
                top: 10.0,
              ),
              child: BarChart(BarChartData(
                // titlesData: const FlTitlesData(),
                minY: 0,
                maxY: 500,
                barGroups: populationData
                    .map((e) => BarChartGroupData(
                            x: int.tryParse(e.surveyWardNumber) ?? 0,
                            barRods: [
                              BarChartRodData(
                                toY: e.maleHhCount?.toDouble() ?? 0,
                                // toY: loadedPopulationData[index]
                                //     .maleCount,
                                width: 20,

                                borderRadius: BorderRadius.circular(2),
                                color: const Color(0xFF1976D2),
                                //fromY: 20,
                                //borderDashArray: [5, 10],
                              ),
                              BarChartRodData(
                                toY: e.femaleHhCount?.toDouble() ?? 0,
                                // toY: loadedPopulationData[index]
                                //     .maleCount,
                                width: 20,
                                borderRadius: BorderRadius.circular(2),
                                color: const Color(0xFF64B5F6),
                                //fromY: 20,
                                //borderDashArray: [5, 10],
                              ),
                            ]))
                    .toList(),
              )),
            ),
          ),
        );
      }
      return const Center(
        child: Text("Something went wrong"),
      );
    });
  }
}
