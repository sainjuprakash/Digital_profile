import 'package:digital_profile/src/features/literacy_status/data/database/literacy_database.dart';

final db = LiteracyDatabase();

Future<int?> addLiteracy(LiteracyTableData entry) async {
  await db.createItem(entry);
}

Future<List<LiteracyTableData>> getAllLiteracyData() async {
  try {
    final List<LiteracyTableData> literacyData =
        await db.select(db.literacyTable).get();
    return literacyData;
  } catch (errMsg) {
    throw Exception(errMsg);
  }
}

Future<void> clearLiteracyData() async {
  final allTables = db.allTables;
  await db.transaction(() async {
    for (var table in allTables) {
      await db.delete(table).go();
    }
  });
}
