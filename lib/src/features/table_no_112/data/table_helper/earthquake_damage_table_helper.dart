
import 'package:digital_profile/src/features/table_no_112/data/database/earthquake_damage_database.dart';

final db = EarthquakeDamageDatabase();

Future<int?> addEarthquakeDamageData(EarthquakeDamageTableData entry) async {
  db.createItem(entry);
}

Future<List<EarthquakeDamageTableData>> getAllEarthquakeDamageData() async {
  try {
    List<EarthquakeDamageTableData> earthquakeData =
        await db.select(db.earthquakeDamageTable).get();
    return earthquakeData;
  } catch (errMsg) {
    throw Exception(errMsg);
  }
}
Future<void> clearEarthquakeDamageData() async {
  final allTables = db.allTables;
  await db.transaction(() async {
    for (var table in allTables) {
      await db.delete(table).go();
    }
  });
}
