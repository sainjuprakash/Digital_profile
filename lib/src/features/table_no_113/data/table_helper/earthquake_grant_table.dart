import 'package:drift/drift.dart';

class EarthquakeGrantTable extends Table {
  TextColumn get villageName => text()();
  IntColumn get wardNumber => integer()();
  IntColumn get gotGranted => integer().nullable()();
  IntColumn get doesNotGotGranted => integer().nullable()();
  IntColumn get notAvailable => integer().nullable()();
  IntColumn get totalGranted => integer().nullable()();
}
