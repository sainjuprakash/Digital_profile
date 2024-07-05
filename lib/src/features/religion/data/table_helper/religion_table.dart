import 'package:drift/drift.dart';

class ReligionTable extends Table{
  IntColumn get wardNumber => integer()();
  IntColumn get hindu => integer().nullable()();
  IntColumn get boudha => integer().nullable()();
  IntColumn get christian => integer().nullable()();
  IntColumn get muslim => integer().nullable()();
  IntColumn get kirat => integer().nullable()();
  IntColumn get jains => integer().nullable()();
  IntColumn get bon => integer().nullable()();
  IntColumn get others => integer().nullable()();
  IntColumn get notAvailable => integer().nullable()();
  IntColumn get wardRelCount => integer().nullable()();
}