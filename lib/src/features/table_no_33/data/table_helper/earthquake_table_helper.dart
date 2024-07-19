import 'package:digital_profile/src/features/table_no_33/data/database/earthquake_database.dart';
import 'package:drift/drift.dart';

final db = EarthquakeDatabase();
Future<int?> addEarthquakeData(EarthquakeTableData entry) async {
  await db.createItem(entry);
}

Future<List<EarthquakeTableData>> getALlEarthquakeResData() async {
  try {
    List<EarthquakeTableData> earthquakeData =
        await db.select(db.earthquakeTable).get();
    return earthquakeData;
  } catch (errMsg) {
    throw Exception(errMsg);
  }
}
Future<void> clearEarthquakeResistanceData() async {
  final allTables = db.allTables;
  await db.transaction(() async {
    for (var table in allTables) {
      await db.delete(table).go();
    }
  });
}
