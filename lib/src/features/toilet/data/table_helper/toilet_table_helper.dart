import 'package:digital_profile/src/features/toilet/data/database/toilet_database.dart';

final db = ToiletDatabase();
Future<int?> addToiletData(ToiletTableData entry) async {
  db.createItem(entry);
}

Future<List<ToiletTableData>> getAllToiletData() async {
  try {
    List<ToiletTableData> toiletData = await db.select(db.toiletTable).get();
    return toiletData;
  } catch (errMsg) {
    throw Exception(errMsg);
  }
}
Future<void> clearToiletData() async {
  final allTables = db.allTables;
  await db.transaction(() async {
    for (var table in allTables) {
      await db.delete(table).go();
    }
  });
}
