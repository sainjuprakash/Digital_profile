import 'package:digital_profile/src/features/health_condition/data/database/health_condition_database.dart';

Future<int?> addHealthData(HealthConditionTableData entry) async {
  final db = HealthConditionDatabase();
  db.createItem(entry);
}

Future<List<HealthConditionTableData>> getAllHealthData() async {
  final db = HealthConditionDatabase();
  try {
    final List<HealthConditionTableData> healthData =
        await db.select(db.healthConditionTable).get();
    return healthData;
  } catch (errMsg) {
    throw Exception(errMsg);
  }
}
