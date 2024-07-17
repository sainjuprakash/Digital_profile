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
    throw Exception(e);
  }
}

Future<void> clearPopulationDatabase() async {
  // Get all tables in the database
  final allTables = db.allTables;

  // Create a transaction to ensure all deletions are performed atomically
  await db.transaction(() async {
    for (var tables in allTables) {
      // Delete all rows from the current table
      await db.delete(tables).go();
    }
  });
}
