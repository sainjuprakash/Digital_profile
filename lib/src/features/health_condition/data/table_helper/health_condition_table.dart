import 'package:drift/drift.dart';

class HealthConditionTable extends Table {
  TextColumn get villageName => text()();
  IntColumn get wardNumber => integer()();
  IntColumn get healthy => integer().nullable()();
  IntColumn get generalDisease => integer().nullable()();
  IntColumn get longTermDisease => integer().nullable()();
  IntColumn get covid => integer().nullable()();
  IntColumn get notAvailable => integer().nullable()();
  IntColumn get totalWardHealthCondition => integer().nullable()();
}
