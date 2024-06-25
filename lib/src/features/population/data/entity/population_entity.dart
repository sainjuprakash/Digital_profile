import 'dart:math';

import 'package:drift/src/runtime/executor/executor.dart';

import '../models/population_model.dart';
import '../population_database/population_database.dart';
import '../repository/population_repository_impl.dart';

void loadPopData(String baseUrl, String endPoint) async {
  if (await isConnectedToWiFi()) {
    List<PopulationModel> populationData =
        await GetPopulationRepository().getPopData(baseUrl, endPoint);
    // final database = PopulationDatabase(QueryExecutor.inDatabaseFolder(
    //   path: 'db.sqlite',
    //   logStatements: true,
    // ));
    final database = PopulationDatabase(e as QueryExecutor);

    for (var data in populationData) {
      final population = Population(
        id: 1,
        title: data.title,
        surveyWardNumber: data.surveyWardNumber,
        maleCount: data.maleCount,
        femaleCount: data.femaleCount,
        othersCount: data.othersCount,
        totalWardPop: data.totalWardPop,
        maleHhCount: data.maleHhCount,
        femaleHhCount: data.femaleHhCount,
        totalWardHhCount: data.totalWardHhCount,
      );
      await database.insertPopulation(population);
    }
  }
}
