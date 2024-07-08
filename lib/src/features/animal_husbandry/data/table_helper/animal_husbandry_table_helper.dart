import 'package:digital_profile/src/features/animal_husbandry/data/database/animal_husbandry_database.dart';

final db = AnimalDatabase();

Future<int?> addAnimalData(AnimalTableData entry) async {
  db.createItem(entry);
}

Future<List<AnimalTableData>> getAllAnimalData() async {
  try {
    List<AnimalTableData> animalsData = await db.select(db.animalTable).get();
    return animalsData;
  } catch (errMsg) {
    throw Exception(errMsg);
  }
}
