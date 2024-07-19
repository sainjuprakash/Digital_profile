import 'package:digital_profile/src/features/insurance/data/database/insurance_database.dart';

final db = InsuranceDatabase();

Future<int?> addInsuranceData(InsuranceTableData entry) async {
  db.createItem(entry);
}

Future<List<InsuranceTableData>> getAllInsuranceData() async {
  try {
    final List<InsuranceTableData> insuranceData =
        await db.select(db.insuranceTable).get();
    return insuranceData;
  } catch (errMsg) {
    throw Exception(errMsg);
  }
}
Future<void> clearInsuranceData() async {
  final allTables = db.allTables;
  await db.transaction(() async {
    for (var table in allTables) {
      await db.delete(table).go();
    }
  });
}
