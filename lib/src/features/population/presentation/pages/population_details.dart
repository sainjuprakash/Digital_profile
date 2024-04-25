import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/population_model.dart';
import '../bloc/population_bloc.dart';

class PopulationDetails extends StatefulWidget {
  const PopulationDetails({super.key});

  @override
  State<PopulationDetails> createState() => _PopulationDetailsState();
}

class _PopulationDetailsState extends State<PopulationDetails> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PopulationBloc, PopulationState>(
        builder: (context, state) {
      if (state is PopulationSuccessState) {
        List<PopulationModel>? populationData = state.populationModel;
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: SizedBox(
            height: 510,
            width: 500,
            child: Padding(
              padding: const EdgeInsets.only(
                top: 10.0,
              ),
              child: BarChart(BarChartData(
                /*titlesData: FlTitlesData(
                     show: true,
                     bottomTitles:SideTitles(
                       showTitles: true,
                       getTextStyles: (context, value) => TextStyle(color: Colors.black),
                       getTitles : (){}
                     ) ),*/
                minY: 0,
                maxY: 1000,
                barGroups: populationData
                    .map((e) => BarChartGroupData(
                            x: int.tryParse(e.surveyWardNumber) ?? 0,
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
        return const Center(child: CircularProgressIndicator());
      } else if (state is PopulationFailureState) {
        return const Center(
          child: Text("Something went wrong"),
        );
      }
      return const Text("Something went wrong");
    });
  }
}
