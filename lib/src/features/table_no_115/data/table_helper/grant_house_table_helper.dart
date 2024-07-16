import 'package:digital_profile/src/features/table_no_115/data/database/grant_house_database.dart';

final db = GrantHouseDatabase();

Future<int?> addGrantHouseDatabase(GrantHouseTableData entry) async {
  db.createItem(entry);
}

Future<List<GrantHouseTableData>> getAllHouseGrantData() async {
  try {
    List<GrantHouseTableData> grantData =
        await db.select(db.grantHouseTable).get();
    return grantData;
  } catch (errMsg) {
    throw Exception(errMsg);
  }
}
