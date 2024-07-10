import 'package:drift/drift.dart';

class OccupationTable extends Table {
  IntColumn get wardNumber => integer()();
  IntColumn get agriculture => integer().nullable()();
  IntColumn get office => integer().nullable()();
  IntColumn get business => integer().nullable()();
  IntColumn get worker => integer().nullable()();
  IntColumn get entrepreneur => integer().nullable()();
  IntColumn get foreignEmp => integer().nullable()();
  IntColumn get student => integer().nullable()();
  IntColumn get houseWife => integer().nullable()();
  IntColumn get unemployed => integer().nullable()();
  IntColumn get underage => integer().nullable()();
  IntColumn get pension => integer().nullable()();
  IntColumn get technical => integer().nullable()();
  IntColumn get seniorCtzn => integer().nullable()();
  IntColumn get others => integer().nullable()();
  IntColumn get notAvailable => integer().nullable()();
  IntColumn get total => integer().nullable()();
}
