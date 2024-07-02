import 'package:digital_profile/src/features/age_table2_2/data/database/age_database.dart';

Future<int?> addPopulation(AgeTableData entry) async {
  final db = AgeDatabase();
  final idEntered = await db.createItem(entry);
  return idEntered;
}

Future<List<AgeTableData>> getAllPopulationData() async {
  final db = AgeDatabase();
  try {
    final List<AgeTableData> populationData =
        await db.select(db.ageTable).get();
    return populationData;
  } catch (e) {
    throw Exception(e);
  }
}
