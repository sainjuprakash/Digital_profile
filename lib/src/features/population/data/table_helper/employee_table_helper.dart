import 'package:digital_profile/src/features/population/data/population_database/population_database.dart';

Future<int> addPopulation(PopulationTableData entry) async {
  final db = MyDatabase();
  final idEntered = await db.createItem(entry);
  print("id entered: ${idEntered}");
  List<PopulationTableData> allItems =
      await db.select(db.populationTable).get();

  print('items in database: $allItems');
  return idEntered;
}
