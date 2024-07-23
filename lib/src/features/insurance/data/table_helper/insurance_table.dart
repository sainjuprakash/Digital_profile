import 'package:drift/drift.dart';

class InsuranceTable extends Table {
  TextColumn get villageName => text()();
  IntColumn get wardNumber => integer()();
  IntColumn get lifeInsurance => integer().nullable()();
  IntColumn get healthInsurance => integer().nullable()();
  IntColumn get liveStockInsurance => integer().nullable()();
  IntColumn get othersInsurance => integer().nullable()();
  IntColumn get notAvailable => integer().nullable()();
  IntColumn get totalInsurance => integer().nullable()();
}
