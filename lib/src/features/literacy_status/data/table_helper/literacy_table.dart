import 'package:drift/drift.dart';

class LiteracyTable extends Table {
  IntColumn get wardNumber => integer()();
  IntColumn get maleLiterate => integer().nullable()();
  IntColumn get malePrePrimary => integer().nullable()();
  IntColumn get malePrimary => integer().nullable()();
  IntColumn get maleSecondary => integer().nullable()();
  IntColumn get maleTechnical => integer().nullable()();
  IntColumn get maleBachelor => integer().nullable()();
  IntColumn get maleMasters => integer().nullable()();
  IntColumn get maleMphil => integer().nullable()();
  IntColumn get maleUnderAge => integer().nullable()();
  IntColumn get maleIlitrate => integer().nullable()();
  IntColumn get maleNotAvailable => integer().nullable()();
  IntColumn get femaleLiterate => integer().nullable()();
  IntColumn get femalePrePrimary => integer().nullable()();
  IntColumn get femalePrimary => integer().nullable()();
  IntColumn get femaleSecondary => integer().nullable()();
  IntColumn get femaleTechincal => integer().nullable()();
  IntColumn get femaleBachelor => integer().nullable()();
  IntColumn get femaleMasters => integer().nullable()();
  IntColumn get femaleMphil => integer().nullable()();
  IntColumn get femaleUnderAge => integer().nullable()();
  IntColumn get femaleIliterate => integer().nullable()();
  IntColumn get femaleNotAvailable => integer().nullable()();
  IntColumn get othersLiterate => integer().nullable()();
  IntColumn get othersPrePrimary => integer().nullable()();
  IntColumn get othersPrimary => integer().nullable()();
  IntColumn get othersSecondary => integer().nullable()();
  IntColumn get othersTechnical => integer().nullable()();
  IntColumn get othersBachelor => integer().nullable()();
  IntColumn get othersMasters => integer().nullable()();
  IntColumn get othersMphil => integer().nullable()();
  IntColumn get othersUnderAge => integer().nullable()();
  IntColumn get othersIliterate => integer().nullable()();
  IntColumn get othersNotAvailable => integer().nullable()();
  IntColumn get totalWardEdu => integer().nullable()();
}