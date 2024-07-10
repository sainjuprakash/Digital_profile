import 'package:digital_profile/src/features/religion/data/database/religion_database.dart';

final db = ReligionDatabase();

Future<int?> addReligion(ReligionTableData entry) async {
  await db.createItem(entry);
}

Future<List<ReligionTableData>> getALlReligionData() async {
  try {
    final List<ReligionTableData> religionData =
        await db.select(db.religionTable).get();
    return religionData;
  } catch (errMsg) {
    throw Exception(errMsg);
  }
}
