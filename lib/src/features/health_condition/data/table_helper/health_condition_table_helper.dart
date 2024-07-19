import 'package:digital_profile/src/features/health_condition/data/database/health_condition_database.dart';

final db = HealthConditionDatabase();

Future<int?> addHealthData(HealthConditionTableData entry) async {
  db.createItem(entry);
}

Future<List<HealthConditionTableData>> getAllHealthData() async {
  try {
    final List<HealthConditionTableData> healthData =
        await db.select(db.healthConditionTable).get();
    return healthData;
  } catch (errMsg) {
    throw Exception(errMsg);
  }
}
Future<void> clearHealthConditionData() async {
  final allTables = db.allTables;
  await db.transaction(() async {
    for (var table in allTables) {
      await db.delete(table).go();
    }
  });
}
