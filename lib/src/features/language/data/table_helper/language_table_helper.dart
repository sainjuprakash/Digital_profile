import 'package:digital_profile/src/features/language/data/database/language_database.dart';

Future<int?> addLanguageData(LanguageTableData entry) async {
  final db = LanguageDatabase();
  final dataEntered = await db.createItem(entry);
  return dataEntered;
}

Future<List<LanguageTableData>> getAllLanguageData() async {
  final db = LanguageDatabase();
  try {
    final List<LanguageTableData> languageData =
        await db.select(db.languageTable).get();
    return languageData;
  } catch (e) {
    throw Exception(e);
  }
}
