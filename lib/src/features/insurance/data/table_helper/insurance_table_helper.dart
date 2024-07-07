import 'package:digital_profile/src/features/insurance/data/database/insurance_database.dart';

Future<int?> addInsuranceData(InsuranceTableData entry) async {
  final db = InsuranceDatabase();
  db.createItem(entry);
}

Future<List<InsuranceTableData>> getAllInsuranceData() async {
  final db = InsuranceDatabase();
  try {
    final List<InsuranceTableData> insuranceData =
        await db.select(db.insuranceTable).get();
    return insuranceData;
  } catch (errMsg) {
    throw Exception(errMsg);
  }
}
