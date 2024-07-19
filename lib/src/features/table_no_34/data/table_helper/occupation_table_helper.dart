import 'package:digital_profile/src/features/table_no_34/data/database/occupation_database.dart';

final db = OccupationDatabase();
Future<int?> addOccupation(OccupationTableData entry) async {
  await db.createItem(entry);
}

Future<List<OccupationTableData>> getAllOccupationData() async {
  try {
    List<OccupationTableData> occupationData =
        await db.select(db.occupationTable).get();
    return occupationData;
  } catch (errMsg) {
    throw Exception(errMsg);
  }
}
Future<void> clearOccupationData() async {
  final allTables = db.allTables;
  await db.transaction(() async {
    for (var table in allTables) {
      await db.delete(table).go();
    }
  });
}
