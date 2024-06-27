import 'dart:io';

import 'package:digital_profile/src/features/population/data/population_database/population_table.dart';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

part 'population_database.g.dart';

@DriftDatabase(tables: [PopulationTable])
class MyDatabase extends _$MyDatabase {
  MyDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;
}


LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));

    return NativeDatabase.createInBackground(file);
  });
}

















































// import 'package:drift/drift.dart';
// import 'package:drift/native.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:path/path.dart' as p;
// import 'dart:io';
//
// // Import part file
// // part 'population_database.g.dart';
//
// // Define the Population table
// class Populations extends Table {
//   IntColumn get surveyWardNumber => integer().nullable()();
//   IntColumn get maleCount => integer().nullable()();
//   IntColumn get femaleCount => integer().nullable()();
//   IntColumn get othersCount => integer().nullable()();
//   IntColumn get totalWardPop => integer().nullable()();
//   IntColumn get maleHhCount => integer().nullable()();
//   IntColumn get femaleHhCount => integer().nullable()();
//   IntColumn get totalWardHhCount => integer().nullable()();
//
//   @override
//   Set<Column> get primaryKey => {surveyWardNumber}; // Define the primary key
// }
//
// // Define the database class
// @DriftDatabase(tables: [Populations])
// class AppDatabase extends _$AppDatabase {
//   AppDatabase() : super(_openConnection());
//
//   @override
//   int get schemaVersion => 1;
//
//   // Database operations
//   Future<List<Population>> getAllPopulations() => select(populations).get();
//   Future<void> insertPopulation(Population population) =>
//       into(populations).insert(population);
//   Future<void> insertPopulations(List<Population> populationList) async {
//     for (var population in populationList) {
//       await into(populations).insert(population, mode: InsertMode.insertOrReplace);
//     }
//   }
//   Future<void> deleteAllPopulations() => delete(populations).go();
// }
//
// // Open the database connection
// LazyDatabase _openConnection() {
//   return LazyDatabase(() async {
//     final dbFolder = await getApplicationDocumentsDirectory();
//     final file = File(p.join(dbFolder.path, 'db.sqlite'));
//     return NativeDatabase(file);
//   });
// }
