import 'package:drift/drift.dart';

class PopulationTable extends Table{
  IntColumn get surveyWardNumber => integer().nullable()();
  IntColumn get maleCount => integer().nullable()();
  IntColumn get femaleCount => integer().nullable()();
  IntColumn get othersCount => integer().nullable()();
  IntColumn get totalWardPop => integer().nullable()();
  IntColumn get maleHhCount => integer().nullable()();
  IntColumn get femaleHhCount => integer().nullable()();
  IntColumn get totalWardHhCount => integer().nullable()();
  }