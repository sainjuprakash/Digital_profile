import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

import '../table_helper/roof_condition_table.dart';
part 'roof_condition_database.g.dart';

@DriftDatabase(tables: [RoofConditionTable])
class RoofConditionDatabase extends _$RoofConditionDatabase {
  RoofConditionDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  Future<int> createItem(RoofConditionTableData entry) {
    return into(roofConditionTable).insert(entry);
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'roof.sqlite'));

    return NativeDatabase.createInBackground(file);
  });
}
