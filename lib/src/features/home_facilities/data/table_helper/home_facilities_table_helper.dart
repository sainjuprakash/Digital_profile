import 'package:digital_profile/src/features/home_facilities/data/database/home_facilities_database.dart';

final db = HomeFacilitiesDatabase();

Future<int?> addHomeFacilities(HomeFacilitiesTableData entry) async {
  db.createItem(entry);
}

Future<List<HomeFacilitiesTableData>> getAllHomeFacilities() async {
  try {
    List<HomeFacilitiesTableData> homeFacilitiesData =
        await db.select(db.homeFacilitiesTable).get();
    return homeFacilitiesData;
  } catch (errMsg) {
    throw Exception(errMsg);
  }
}