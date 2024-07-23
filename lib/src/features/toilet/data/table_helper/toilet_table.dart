import 'package:drift/drift.dart';

class ToiletTable extends Table {
  TextColumn get villageName => text()();
  IntColumn get wardNumber => integer()();
  IntColumn get noToilet => integer().nullable()();
  IntColumn get publicDhal => integer().nullable()();
  IntColumn get seftiTank => integer().nullable()();
  IntColumn get ordinary => integer().nullable()();
  IntColumn get notAvailable => integer().nullable()();
  IntColumn get totalToilet => integer().nullable()();
}
