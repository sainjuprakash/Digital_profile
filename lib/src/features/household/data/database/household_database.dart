import 'dart:io';
import 'package:digital_profile/src/features/household/data/table_helper/household_table.dart';
import 'package:path/path.dart' as p;

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';

import '../model/individual_family_model.dart';
import '../table_helper/household_table_helper.dart';
part 'household_database.g.dart';

@DriftDatabase(tables: [HouseholdTable])
class HouseholdDatabase extends _$HouseholdDatabase {
  HouseholdDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  Future<int> createItem(HouseholdTableData item) {
    return into(householdTable).insert(item);
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'household.sqlite'));

    return NativeDatabase.createInBackground(file);
  });
}
