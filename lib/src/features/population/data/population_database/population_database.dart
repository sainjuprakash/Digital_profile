import 'package:drift/drift.dart';

part 'population_database.g.dart';

@DataClassName('Population')
class Populations extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text().nullable()();
  IntColumn get surveyWardNumber => integer().nullable()();
  IntColumn get maleCount => integer().nullable()();
  IntColumn get femaleCount => integer().nullable()();
  IntColumn get othersCount => integer().nullable()();
  IntColumn get totalWardPop => integer().nullable()();
  IntColumn get maleHhCount => integer().nullable()();
  IntColumn get femaleHhCount => integer().nullable()();
  IntColumn get totalWardHhCount => integer().nullable()();
}

@DriftDatabase(tables: [Populations])
class PopulationDatabase extends _$PopulationDatabase {
  PopulationDatabase(super.e);

  @override
  int get schemaVersion => 1;

  Future<void> insertPopulation(Population population) =>
      into(populations).insert(population);

  Future<List<Population>> getAllPopulations() => select(populations).get();
}

