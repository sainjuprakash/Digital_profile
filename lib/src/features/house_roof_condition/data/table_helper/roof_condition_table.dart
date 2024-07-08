import 'package:drift/drift.dart';


class RoofConditionTable extends Table {
  IntColumn get wardNumber => integer()();
  IntColumn get khar => integer().nullable()();
  IntColumn get jasta => integer().nullable()();
  IntColumn get stoneTile => integer().nullable()();
  IntColumn get rcc => integer().nullable()();
  IntColumn get wood => integer().nullable()();
  IntColumn get mud => integer().nullable()();
  IntColumn get others => integer().nullable()();
  IntColumn get notAvailable => integer().nullable()();
  IntColumn get totalRoof => integer().nullable()();
}
