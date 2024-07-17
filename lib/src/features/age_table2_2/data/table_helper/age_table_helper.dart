import 'package:digital_profile/src/features/age_table2_2/data/database/age_database.dart';

final db = AgeDatabase();

Future<int?> addAgePopulation(AgeTableData entry) async {
  await db.createItem(entry);
}

Future<List<AgeTableData>> getAllAgePopulationData() async {
  try {
    final List<AgeTableData> agePopulationData =
        await db.select(db.ageTable).get();
    return agePopulationData;
  } catch (e) {
    throw Exception(e);
  }
}
Future<void> clearAgePopulationDatabase() async {
  final allTables = db.allTables;

  await db.transaction(() async {
    for (var table in allTables) {
      await db.delete(table).go();
    }
  });
}
