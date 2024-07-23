import 'package:drift/drift.dart';

class ResidenceTable extends Table {
  TextColumn get villageName => text()();
  IntColumn get wardNumber => integer()();
  IntColumn get lsDefault => integer().nullable()();
  IntColumn get lsForeign => integer().nullable()();
  IntColumn get lsCountrySide => integer().nullable()();
  IntColumn get lsNotAvailable => integer().nullable()();
  IntColumn get lsTotalLivingStatus => integer().nullable()();
}
