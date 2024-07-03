import 'package:digital_profile/src/features/age_table2_2/data/database/age_database.dart';

Future<int?> addAgePopulation(AgeTableData entry) async {
  final db = AgeDatabase();
  final idEntered = await db.createItem(entry);
  return idEntered;
}

Future<List<AgeTableData>> getAllAgePopulationData() async {
  final db = AgeDatabase();
  try {
    final List<AgeTableData> agePopulationData =
        await db.select(db.ageTable).get();
    return agePopulationData;
  } catch (e) {
    throw Exception(e);
  }
}
