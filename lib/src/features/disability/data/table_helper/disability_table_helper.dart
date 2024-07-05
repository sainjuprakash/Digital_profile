import 'package:digital_profile/src/features/disability/data/database/disability_database.dart';

Future<int?> addDisability(DisabilityTableData data) async {
  final db = DisabilityDatabase();
  final dataEntered = db.createItem(data);
  return dataEntered;
}

Future<List<DisabilityTableData>> getAllDisabilityData() async {
  final db = DisabilityDatabase();
  try {
    final List<DisabilityTableData> disabilityData =
        await db.select(db.disabilityTable).get();
    return disabilityData;
  } catch (errMsg) {
    throw Exception(errMsg);
  }
}
