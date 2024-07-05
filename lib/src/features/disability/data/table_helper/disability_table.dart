import 'package:drift/drift.dart';

class DisabilityTable extends Table {
  IntColumn get wardNumber => integer()();
  IntColumn get able => integer().nullable()();
  IntColumn get disable => integer().nullable()();
  IntColumn get deaf => integer().nullable()();
  IntColumn get blind => integer().nullable()();
  IntColumn get hearingLoss => integer().nullable()();
  IntColumn get slammer => integer().nullable()();
  IntColumn get celeberal => integer().nullable()();
  IntColumn get redarded => integer().nullable()();
  IntColumn get multiDisable => integer().nullable()();
  IntColumn get mental => integer().nullable()();
  IntColumn get notAvailable => integer().nullable()();
  IntColumn get totalDisabilityStatus => integer().nullable()();
}
