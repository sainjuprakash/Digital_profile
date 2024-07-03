import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import '../table_helper/ethnicity_household_table.dart';
part 'ethnicity_household_database.g.dart';

@DriftDatabase(tables: [EthnicityHhTable])
class EthnicityHouseholdDatabase extends _$EthnicityHouseholdDatabase {
  EthnicityHouseholdDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  Future<int> createItem(EthnicityHhTableData item) {
    return into(ethnicityHhTable).insert(item);
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'ethnicityHh.sqlite'));

    return NativeDatabase.createInBackground(file);
  });
}
