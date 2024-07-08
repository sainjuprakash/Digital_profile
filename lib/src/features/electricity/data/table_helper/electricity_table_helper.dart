import 'package:digital_profile/src/features/electricity/data/database/electricity_database.dart';

final db = ElectricityDatabase();

Future<int?> addElectricityData(ElectricityTableData entry) async {
  db.createItem(entry);
}

Future<List<ElectricityTableData>> getAllElectricityData() async {
  try {
    List<ElectricityTableData> electricityData =
        await db.select(db.electricityTable).get();
    return electricityData;
  } catch (errMsg) {
    throw Exception(errMsg);
  }
}
