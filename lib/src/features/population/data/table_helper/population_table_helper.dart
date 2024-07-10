import 'package:digital_profile/src/features/population/data/population_database/population_database.dart';

final db = PopulationDatabase();

Future<int?> addPopulation(PopulationTableData entry) async {
  await db.createItem(entry);
}

Future<List<PopulationTableData>> getAllPopulationData() async {
  try {
    final List<PopulationTableData> populationData =
        await db.select(db.populationTable).get();
    return populationData;
  } catch (e) {
    //print('Error retrieving data: $e');
    throw Exception(e);
  }
}
