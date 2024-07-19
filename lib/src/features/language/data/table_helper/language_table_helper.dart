import 'package:digital_profile/src/features/language/data/database/language_database.dart';

final db = LanguageDatabase();

Future<int?> addLanguageData(LanguageTableData entry) async {
  final dataEntered = await db.createItem(entry);
  return dataEntered;
}

Future<List<LanguageTableData>> getAllLanguageData() async {
  try {
    final List<LanguageTableData> languageData =
        await db.select(db.languageTable).get();
    return languageData;
  } catch (e) {
    throw Exception(e);
  }
}
Future<void> clearLanguageData() async {
  final allTables = db.allTables;
  await db.transaction(() async {
    for (var table in allTables) {
      await db.delete(table).go();
    }
  });
}
