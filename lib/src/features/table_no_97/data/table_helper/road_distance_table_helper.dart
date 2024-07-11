import 'package:digital_profile/src/features/table_no_97/data/database/road_distance_database.dart';

final db = RoadDistanceDatabase();

Future<int?> addRoadHouseData(RoadDistanceTableData entry) async {
  db.createItem(entry);
}

Future<List<RoadDistanceTableData>> getAllRoadDistanceData() async {
  try {
    List<RoadDistanceTableData> roadData =
        await db.select(db.roadDistanceTable).get();
    return roadData;
  } catch (errMsg) {
    throw Exception(errMsg);
  }
}
