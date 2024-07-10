import 'package:digital_profile/src/features/marriage/data/database/marriage_database.dart';

final db = MarriageDatabase();

Future<int?> addMarriage(MarriageTableData entry) async {
  await db.createItem(entry);
}

Future<List<MarriageTableData>> getAllMarriageData() async {
  try {
    final List<MarriageTableData> marriageData =
        await db.select(db.marriageTable).get();
    return marriageData;
  } catch (errMsg) {
    throw Exception(errMsg);
  }
}
