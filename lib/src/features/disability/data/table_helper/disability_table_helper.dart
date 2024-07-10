import 'package:digital_profile/src/features/disability/data/database/disability_database.dart';

final db = DisabilityDatabase();

Future<int?> addDisability(DisabilityTableData data) async {
  await db.createItem(data);
}

Future<List<DisabilityTableData>> getAllDisabilityData() async {
  try {
    final List<DisabilityTableData> disabilityData =
        await db.select(db.disabilityTable).get();
    return disabilityData;
  } catch (errMsg) {
    throw Exception(errMsg);
  }
}
