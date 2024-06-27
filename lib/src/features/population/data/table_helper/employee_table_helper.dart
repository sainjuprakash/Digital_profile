import 'package:digital_profile/src/features/population/data/population_database/population_database.dart';
import 'package:drift/drift.dart';
import '../population_database/population_table.dart';

Future<int> addPopulation(PopulationTableCompanion entry) async {
  final db = MyDatabase();
  return await db.into(db.populationTable).insert(entry);
}
