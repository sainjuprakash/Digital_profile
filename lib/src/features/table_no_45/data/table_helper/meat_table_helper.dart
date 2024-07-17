import 'package:digital_profile/src/features/table_no_45/data/database/meat_database.dart';

final db = MeatDatabase();

Future<int?> addMeatData(MeatTableData entry) async {
  db.createItem(entry);
}

Future<List<MeatTableData>> getAllMeatData() async {
  try {
    List<MeatTableData> meatData = await db.select(db.meatTable).get();
    return meatData;
  } catch (errMsg) {
    throw Exception(errMsg);
  }
}

Future<void> clearMeatDatabase() async {
  final allTables = db.allTables;

  await db.transaction(() async {
    for (var table in allTables) {
      await db.delete(table).go();
    }
  });
}
