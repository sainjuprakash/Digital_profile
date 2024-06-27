import 'package:digital_profile/src/features/population/data/population_database/population_database.dart';
import 'package:digital_profile/src/features/population/data/repository/population_repository_impl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/population_bloc.dart';

class PopulationPage extends StatelessWidget {
  String baseUrl, endPoint;
  PopulationPage(this.baseUrl, this.endPoint, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Population Data')),
      body: BlocProvider(
        create: (context) => PopulationBloc(
            RepositoryProvider.of<GetPopulationRepository>(context),
            baseUrl,
            endPoint),
        child: BlocBuilder<PopulationBloc, PopulationState>(
          builder: (context, state) {
            if (state is PopulationLoadingState) {
              return Center(child: CircularProgressIndicator());
            } else if (state is PopulationSuccessState) {
              return ListView.builder(
                itemCount: state.populationModel.length,
                itemBuilder: (context, index) {
                  final population = state.populationModel[index];
                  return ListTile(
                    title: Text(population.title ?? 'No title'),
                    subtitle: Text('Ward: ${population.surveyWardNumber}, '
                        'Male: ${population.maleCount}, '
                        'Female: ${population.femaleCount}, '
                        'Others: ${population.othersCount}, '
                        'Total: ${population.totalWardPop}'),
                  );
                },
              );
            } else if (state is PopulationFailureState) {
              return Center(
                  child: Text('Failed to load data: ${state.errmsg}'));
            } else {
              return Center(child: Text('No Data Available'));
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<PopulationBloc>().add(LoadPopulationEvent());
        },
        child: Icon(Icons.refresh),
      ),
    );
  }
}
