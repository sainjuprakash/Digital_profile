import 'package:drift/drift.dart';

class EthnicityHhTable extends Table {
  IntColumn get wardNumber => integer()();
  IntColumn get muslim => integer().nullable()();
  IntColumn get hillBrahman => integer().nullable()();
  IntColumn get teraiBrahman => integer().nullable()();
  IntColumn get hillJanajati => integer().nullable()();
  IntColumn get teraiJanajati => integer().nullable()();
  IntColumn get hillDalit => integer().nullable()();
  IntColumn get notAvailable => integer().nullable()();
  IntColumn get totalEthnicity => integer().nullable()();
}
