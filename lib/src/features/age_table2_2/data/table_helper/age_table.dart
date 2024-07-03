import 'package:drift/drift.dart';

class AgeTable extends Table {
  IntColumn get surveyWardNumber => integer()();
  IntColumn get maleLessThanSix => integer().nullable()();
  IntColumn get maleSixToFifteen => integer().nullable()();
  IntColumn get maleSixteenToFortyNine => integer().nullable()();
  IntColumn get maleFiftyToSixtyNine => integer().nullable()();
  IntColumn get maleSeventyToNinety => integer().nullable()();
  IntColumn get maleAboveNinety => integer().nullable()();
  IntColumn get femaleLessThanSix => integer().nullable()();
  IntColumn get femaleSixToFifteen => integer().nullable()();
  IntColumn get femaleSixteenToFortyNine => integer().nullable()();
  IntColumn get femaleFiftyToSixtyNine => integer().nullable()();
  IntColumn get femaleSeventyToNinety => integer().nullable()();
  IntColumn get femaleNinetyAbove => integer().nullable()();
  IntColumn get othersLessThanSix => integer().nullable()();
  IntColumn get othersSixToFifteen => integer().nullable()();
  IntColumn get othersSixteenFortyNine => integer().nullable()();
  IntColumn get othersFiftyToSixtyNine => integer().nullable()();
  IntColumn get othersSeventyToNinety => integer().nullable()();
  IntColumn get othersAboveNinety => integer().nullable()();
  IntColumn get totalWardCount => integer().nullable()();
}
