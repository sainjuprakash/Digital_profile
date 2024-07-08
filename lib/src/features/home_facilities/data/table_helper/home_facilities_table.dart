import 'package:drift/drift.dart';

class HomeFacilitiesTable extends Table{
  IntColumn get wardNumber => integer()();
  IntColumn get radio => integer().nullable()();
  IntColumn get television => integer().nullable()();
  IntColumn get telephone => integer().nullable()();
  IntColumn get computer => integer().nullable()();
  IntColumn get internet => integer().nullable()();
  IntColumn get motorcycle => integer().nullable()();
  IntColumn get car => integer().nullable()();
  IntColumn get refrigerator => integer().nullable()();
  IntColumn get bus => integer().nullable()();
  IntColumn get none => integer().nullable()();
  IntColumn get houseCount => integer().nullable()();
  IntColumn get totalWardAminity => integer().nullable()();

}