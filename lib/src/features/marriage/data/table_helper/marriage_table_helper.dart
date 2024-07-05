import 'package:digital_profile/src/features/marriage/data/database/marriage_database.dart';

Future<int?> addMarriage(MarriageTableData entry) async {
  final db = MarriageDatabase();
  db.createItem(entry);
}

Future<List<MarriageTableData>> getAllMarriageData() async {
  final db = MarriageDatabase();
  try {
    final List<MarriageTableData> marriageData =
        await db.select(db.marriageTable).get();
    return marriageData;
  } catch (errMsg) {
    throw Exception(errMsg);
  }
}
