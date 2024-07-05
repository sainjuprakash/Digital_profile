import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;

import 'package:path_provider/path_provider.dart';

import '../table_helper/disability_table.dart';
part 'disability_database.g.dart';

@DriftDatabase(tables: [DisabilityTable])
class DisabilityDatabase extends _$DisabilityDatabase {
  DisabilityDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  Future<int> createItem(DisabilityTableData entry) {
    return into(disabilityTable).insert(entry);
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'disability.sqlite'));

    return NativeDatabase.createInBackground(file);
  });
}
