import 'package:digital_profile/src/features/residence/data/database/residence_database.dart';

final db = ResidenceDatabase();

Future<int?> addResidence(ResidenceTableData entry) async {
  await db.createItem(entry);
}

Future<List<ResidenceTableData>> getAllResidenceData() async {
  try {
    final List<ResidenceTableData> residenceData =
        await db.select(db.residenceTable).get();
    return residenceData;
  } catch (errMsg) {
    throw Exception(errMsg);
  }
}

Future<void> clearResidenceData() async {
  final allTables = db.allTables;
  await db.transaction(() async {
    for (var table in allTables) {
      await db.delete(table).go();
    }
  });
}
