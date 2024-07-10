import 'package:drift/drift.dart';

class IncomeTable extends Table {
  IntColumn get wardNumber => integer()();
  IntColumn get crops => integer().nullable()();
  IntColumn get fruits => integer().nullable()();
  IntColumn get livestock => integer().nullable()();
  IntColumn get vegi => integer().nullable()();
  IntColumn get medi => integer().nullable()();
  IntColumn get labour => integer().nullable()();
  IntColumn get business => integer().nullable()();
  IntColumn get foreignEmp => integer().nullable()();
  IntColumn get office => integer().nullable()();
  IntColumn get others => integer().nullable()();
  IntColumn get total => integer().nullable()();
}
