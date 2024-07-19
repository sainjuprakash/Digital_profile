import 'package:digital_profile/src/features/table_no_114/data/database/grant_stage_database.dart';

final db = GrantStageDatabase();

Future<int?> addGrantStageData(GrantStageTableData entry) async {
  db.createItem(entry);
}

Future<List<GrantStageTableData>> getAllGrantStage() async {
  try {
    List<GrantStageTableData> grantModel =
        await db.select(db.grantStageTable).get();
    return grantModel;
  } catch (errMsg) {
    throw Exception(errMsg);
  }
}
Future<void> clearGrantStageData() async {
  final allTables = db.allTables;
  await db.transaction(() async {
    for (var table in allTables) {
      await db.delete(table).go();
    }
  });
}
