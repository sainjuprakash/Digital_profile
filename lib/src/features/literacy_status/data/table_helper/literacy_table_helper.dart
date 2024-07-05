import 'package:digital_profile/src/features/literacy_status/data/database/literacy_database.dart';

Future<int?> addLiteracy(LiteracyTableData entry) async {
  final db = LiteracyDatabase();
  final dataEntered = db.createItem(entry);
  return dataEntered;
}

Future<List<LiteracyTableData>> getAllLiteracyData() async {
  final db = LiteracyDatabase();
  try {
    final List<LiteracyTableData> literacyData =
        await db.select(db.literacyTable).get();
    return literacyData;
  } catch (errMsg) {
    throw Exception(errMsg);
  }
}
