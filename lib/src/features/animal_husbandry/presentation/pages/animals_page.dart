import 'package:digital_profile/constant/spacing.dart';
import 'package:digital_profile/src/features/animal_husbandry/presentation/widgets/animals_bar_chart.dart';
import 'package:digital_profile/src/features/animal_husbandry/presentation/widgets/animals_data_table.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/model/animals_model.dart';
import '../../data/repository/animals_repository_impl.dart';
import '../bloc/animals_bloc.dart';

class AnimalsPage extends StatefulWidget {
  String baseUrl, endPoint;
  AnimalsPage(this.baseUrl, this.endPoint, {super.key});

  @override
  State<AnimalsPage> createState() => _AnimalsPageState();
}

class _AnimalsPageState extends State<AnimalsPage> {
  int totalHouses = 0;
  int totalBirds = 0;
  int totalNoAnimals = 0;
  int totalLiveStock = 0;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AnimalsBloc(
          RepositoryProvider.of<ImplAnimalRepository>(context),
          widget.baseUrl,
          widget.endPoint)
        ..add(GetAnimalsEvent()),
      child: BlocBuilder<AnimalsBloc, AnimalsState>(
        builder: (context, state) {
          if (state is AnimalsSuccessState) {
            List<AnimalsModel> fetchedAnimalsData = state.fetchedAnimalsModel;
            fetchedAnimalsData.asMap().forEach((key, value) {
              totalBirds += fetchedAnimalsData[key].wardBirds ?? 0;
              totalLiveStock += fetchedAnimalsData[key].wardLivestock ?? 0;
              totalHouses += fetchedAnimalsData[key].wardHouses ?? 0;
              totalNoAnimals = totalHouses - (totalBirds + totalLiveStock);
            });
          }
          return SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                AnimalBarChart(
                    totalBirds, totalLiveStock, totalHouses, totalNoAnimals),
                verticalspace(),
                AnimalDataTable(
                    totalBirds, totalLiveStock, totalHouses, totalNoAnimals)
              ],
            ),
          );
        },
      ),
    );
  }
}
