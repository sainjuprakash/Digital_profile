import 'package:digital_profile/src/features/population/data/population_database/population_database.dart';

Future<int?> addPopulation(PopulationTableData entry) async {
  final db = PopulationDatabase();
  final idEntered = await db.createItem(entry);
  return idEntered;
}

Future<List<PopulationTableData>> getAllPopulationData() async {
  final db = PopulationDatabase();
  try {
    final List<PopulationTableData> populationData =
        await db.select(db.populationTable).get();
    return populationData;
  } catch (e) {
    //print('Error retrieving data: $e');
    throw Exception(e);
  }
}
