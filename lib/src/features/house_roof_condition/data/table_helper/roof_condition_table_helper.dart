import 'package:digital_profile/src/features/house_roof_condition/data/database/roof_condition_database.dart';

final db = RoofConditionDatabase();

Future<int?> addRoofData(RoofConditionTableData entry) async {
  db.createItem(entry);
}

Future<List<RoofConditionTableData>> getAllRoofData() async {
  try {
    List<RoofConditionTableData> roofData =
        await db.select(db.roofConditionTable).get();
    return roofData;
  } catch (errMsg) {
    throw Exception(errMsg);
  }
}

Future<void> clearRoofConditionData() async {
  final allTables = db.allTables;
  await db.transaction(() async {
    for (var table in allTables) {
      await db.delete(table).go();
    }
  });
}
