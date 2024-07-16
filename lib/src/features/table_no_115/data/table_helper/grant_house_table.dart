import 'package:drift/drift.dart';

class GrantHouseTable extends Table {
  IntColumn get wardNumber => integer()();
  IntColumn get hasBuild => integer().nullable()();
  IntColumn get hasNotBuild => integer().nullable()();
  IntColumn get notAvailable => integer().nullable()();
  IntColumn get total => integer().nullable()();
}
