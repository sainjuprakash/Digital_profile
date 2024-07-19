import 'package:digital_profile/src/initial_page/data/database/village_database.dart';
import 'package:digital_profile/src/initial_page/data/table_helper/village_table.dart';
import 'package:drift/drift.dart';

final db = VillageDatabase();

Future<int?> addVillageData(VillageTableData entry) async {
  db.createItem(entry);
}

Future<List<VillageTableData>> getAllVillageData() async {
  try {
    List<VillageTableData> villageData = await db.select(db.villageTable).get();
    return villageData;
  } catch (errMsg) {
    throw Exception(errMsg);
  }
}

Future<void> clearVillageData() async {
  final allTables = db.allTables;
  await db.transaction(() async {
    for (var table in allTables) {
      await db.delete(table).go();
    }
  });
}

