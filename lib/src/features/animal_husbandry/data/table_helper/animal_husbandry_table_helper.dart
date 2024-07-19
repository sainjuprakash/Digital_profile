import 'package:digital_profile/src/features/animal_husbandry/data/database/animal_husbandry_database.dart';

final db = AnimalDatabase();

Future<int?> addAnimalData(AnimalTableData entry) async {
  await db.createItem(entry);
}

Future<List<AnimalTableData>> getAllAnimalData() async {
  try {
    List<AnimalTableData> animalsData = await db.select(db.animalTable).get();
    return animalsData;
  } catch (errMsg) {
    throw Exception(errMsg);
  }
}

Future<void> clearAnimalHusbandryData() async {
  final allTables = db.allTables;
  await db.transaction(() async {
    for (var table in allTables) {
      await db.delete(table).go();
    }
  });
}
