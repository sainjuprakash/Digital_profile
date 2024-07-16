import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

import '../table_helper/grant_house_table.dart';
part 'grant_house_database.g.dart';

@DriftDatabase(tables: [GrantHouseTable])
class GrantHouseDatabase extends _$GrantHouseDatabase {
  GrantHouseDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  Future<int> createItem(GrantHouseTableData entry) {
    return into(grantHouseTable).insert(entry);
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'grantHouse.sqlite'));

    return NativeDatabase.createInBackground(file);
  });
}
