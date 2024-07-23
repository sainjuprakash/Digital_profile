import 'package:drift/drift.dart';

class RoadDistanceTable extends Table {
  TextColumn get villageName => text()();
  IntColumn get wardNumber => integer()();
  IntColumn get lessThanOneHours => integer().nullable()();
  IntColumn get twoHours => integer().nullable()();
  IntColumn get upToFiveHours => integer().nullable()();
  IntColumn get moreThanFive => integer().nullable()();
  IntColumn get total => integer().nullable()();
}
