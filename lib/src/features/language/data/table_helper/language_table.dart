import 'package:drift/drift.dart';

class LanguageTable extends Table {
  TextColumn get villageName => text()();
  IntColumn get wardNo => integer()();
  IntColumn get nepali => integer().nullable()();
  IntColumn get tamang => integer().nullable()();
  IntColumn get sherpa => integer().nullable()();
  IntColumn get limbu => integer().nullable()();
  IntColumn get rai => integer().nullable()();
  IntColumn get gurung => integer().nullable()();
  IntColumn get ghale => integer().nullable()();
  IntColumn get othersLanguage => integer().nullable()();
  IntColumn get notAvailable => integer().nullable()();
  IntColumn get totalLanguageCount => integer().nullable()();
}
