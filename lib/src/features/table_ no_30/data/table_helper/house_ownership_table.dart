import 'package:drift/drift.dart';

class OwnershipTable extends Table{
  IntColumn get wardNumber => integer()();
  IntColumn get personal => integer().nullable()();
  IntColumn get rental => integer().nullable()();
  IntColumn get organizational => integer().nullable()();
  IntColumn get sukumbasi => integer().nullable()();
  IntColumn get others => integer().nullable()();
  IntColumn get notAvailable => integer().nullable()();
  IntColumn get total => integer().nullable()();

}