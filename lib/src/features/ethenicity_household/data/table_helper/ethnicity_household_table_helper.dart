import 'package:digital_profile/src/features/ethenicity_household/data/database/ethnicity_household_database.dart';

final db = EthnicityHouseholdDatabase();

Future<int?> addEthnicityHousehold(EthnicityHhTableData entry) async {
  await db.createItem(entry);
}

Future<List<EthnicityHhTableData>> getALlEthnicityHousehold() async {
  try {
    final List<EthnicityHhTableData> ethnicityData =
        await db.select(db.ethnicityHhTable).get();
    return ethnicityData;
  } catch (e) {
    throw Exception(e);
  }
}
