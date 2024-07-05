import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;

import 'package:path_provider/path_provider.dart';

import '../table_helper/literacy_table.dart';
part 'literacy_database.g.dart';

@DriftDatabase(tables: [LiteracyTable])
class LiteracyDatabase extends _$LiteracyDatabase {
  LiteracyDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  Future<int> createItem(LiteracyTableData item) {
    return into(literacyTable).insert(item);
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'literacy.sqlite'));

    return NativeDatabase.createInBackground(file);
  });
}
