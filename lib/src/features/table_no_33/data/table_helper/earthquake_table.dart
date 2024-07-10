import 'package:drift/drift.dart';

class EarthquakeTable extends Table {
  IntColumn get wardNumber => integer()();
  IntColumn get earthquakeResistance => integer().nullable()();
  IntColumn get notEarthquakeResistance => integer().nullable()();
  IntColumn get total => integer().nullable()();
}
