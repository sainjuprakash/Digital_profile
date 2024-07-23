import 'package:drift/drift.dart';

class AllowanceTable extends Table {
  TextColumn get villageName => text()();
  IntColumn get wardNumber => integer()();
  IntColumn get processWrong => integer().nullable()();
  IntColumn get briddhaBhatta => integer().nullable()();
  IntColumn get widow => integer().nullable()();
  IntColumn get widower => integer().nullable()();
  IntColumn get disabled => integer().nullable()();
  IntColumn get notTaken => integer().nullable()();
  IntColumn get notProcessed => integer().nullable()();
  IntColumn get indigenous => integer().nullable()();
  IntColumn get notAvailable => integer().nullable()();
  IntColumn get socialSecurity => integer().nullable()();
}
