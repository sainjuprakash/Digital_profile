import 'package:drift/drift.dart';

class SettlementTable extends Table {
  TextColumn get villageName => text()();
  IntColumn get wardNumber => integer()();
  IntColumn get permanent => integer().nullable()();
  IntColumn get temporary => integer().nullable()();
  IntColumn get others => integer().nullable()();
  IntColumn get total => integer().nullable()();
}
