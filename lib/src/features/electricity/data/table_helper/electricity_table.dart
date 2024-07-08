import 'package:drift/drift.dart';

class ElectricityTable extends Table {
  IntColumn get wardNumber => integer()();
  IntColumn get kerosene => integer().nullable()();
  IntColumn get bioGas => integer().nullable()();
  IntColumn get solar => integer().nullable()();
  IntColumn get electricityLaghu => integer().nullable()();
  IntColumn get electricityNational => integer().nullable()();
  IntColumn get others => integer().nullable()();
  IntColumn get notAvailable => integer().nullable()();
  IntColumn get totalHouseCount => integer().nullable()();
}
