import 'dart:io';
import 'package:path/path.dart' as p;

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';

import '../table_helper/home_facilities_table.dart';
part 'home_facilities_database.g.dart';

@DriftDatabase(tables: [HomeFacilitiesTable])
class HomeFacilitiesDatabase extends _$HomeFacilitiesDatabase{
  HomeFacilitiesDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  Future<int> createItem(HomeFacilitiesTableData entry) {
    return into(homeFacilitiesTable).insert(entry);
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'homeFacilities.sqlite'));

    return NativeDatabase.createInBackground(file);
  });
}