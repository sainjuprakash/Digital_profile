import 'package:digital_profile/src/features/religion/data/database/religion_database.dart';

Future<int?> addReligion(ReligionTableData entry) async {
  final db = ReligionDatabase();
  final dataEntered = db.createItem(entry);
  return dataEntered;
}

Future<List<ReligionTableData>> getALlReligionData() async {
  final db = ReligionDatabase();
  try {
    final List<ReligionTableData> religionData =
        await db.select(db.religionTable).get();
    return religionData;
  } catch (errMsg) {
    throw Exception(errMsg);
  }
}
