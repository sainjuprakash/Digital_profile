import 'package:digital_profile/src/features/ethenicity_household/data/database/ethnicity_household_database.dart';

Future<int?> addEthnicityHousehold(EthnicityHhTableData entry) async {
  final db = EthnicityHouseholdDatabase();
  final dataEntered = await db.createItem(entry);
  return dataEntered;
}

Future<List<EthnicityHhTableData>> getALlEthnicityHousehold() async {
  final db = EthnicityHouseholdDatabase();
  try {
    final List<EthnicityHhTableData> ethnicityData =
        await db.select(db.ethnicityHhTable).get();
    return ethnicityData;
  } catch (e) {
    throw Exception(e);
  }
}
