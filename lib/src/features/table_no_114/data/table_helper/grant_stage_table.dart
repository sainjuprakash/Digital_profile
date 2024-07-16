import 'package:drift/drift.dart';

class GrantStageTable extends Table {
  IntColumn get wardNumber => integer()();
  IntColumn get firstStage => integer().nullable()();
  IntColumn get secondStage => integer().nullable()();
  IntColumn get thirdStage => integer().nullable()();
  IntColumn get notAvailable => integer().nullable()();
  IntColumn get total => integer().nullable()();
}
