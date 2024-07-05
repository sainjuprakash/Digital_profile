import 'dart:convert';

import 'package:drift/drift.dart';

import '../model/individual_family_model.dart';
import 'household_table_helper.dart';

class HouseholdTable extends Table {
  IntColumn get id => integer()();
  IntColumn get houseNumber => integer().nullable()();
  TextColumn get wardNo => text().nullable()();
  TextColumn get setName => text().nullable()();
  TextColumn get road => text().nullable()();
  TextColumn get roadToHouse => text().nullable()();
  TextColumn get respondent => text()();
  TextColumn get phoneNumber => text().nullable()();
  TextColumn get relationHh => text().nullable()();
  TextColumn get migrationType => text().nullable()();
  IntColumn get familyCount => integer().nullable()();
  TextColumn get isDeath => text().nullable()();
  IntColumn get deathQty => integer().nullable()();
  TextColumn get latitude => text().nullable()();
  TextColumn get longitude => text().nullable()();
  TextColumn get individualData =>
      text().map(IndividualFamilyDataListConverter())();
}
