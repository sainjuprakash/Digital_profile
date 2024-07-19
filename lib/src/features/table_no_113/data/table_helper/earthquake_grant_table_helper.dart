import 'package:digital_profile/src/features/table_no_113/data/database/earthquake_grant_database.dart';

final db = EarthquakeGrantDatabase();

Future<int?> addEarthquakeGrantData(EarthquakeGrantTableData entry) async {
  db.createItem(entry);
}

Future<List<EarthquakeGrantTableData>> getAllEarthquakeGrantData() async {
  try {
    List<EarthquakeGrantTableData> earthquakeData =
        await db.select(db.earthquakeGrantTable).get();
    return earthquakeData;
  } catch (errMsg) {
    throw Exception(errMsg);
  }
}
Future<void> clearEarthquakeGrantData() async {
  final allTables = db.allTables;
  await db.transaction(() async {
    for (var table in allTables) {
      await db.delete(table).go();
    }
  });
}
