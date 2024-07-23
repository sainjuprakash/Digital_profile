import 'package:drift/drift.dart';

class ChildWorkerTable extends Table {
  TextColumn get villageName => text()();
  IntColumn get wardNumber => integer()();
  IntColumn get yes => integer().nullable()();
  IntColumn get no => integer().nullable()();
  IntColumn get notAvailable => integer().nullable()();
  IntColumn get wardHouses => integer().nullable()();
  IntColumn get totalUnderSixteen => integer().nullable()();
}
