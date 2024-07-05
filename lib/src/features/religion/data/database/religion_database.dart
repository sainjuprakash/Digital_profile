import 'dart:io';
import 'package:digital_profile/src/features/religion/data/table_helper/religion_table.dart';
import 'package:path/path.dart' as p;

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
part 'religion_database.g.dart';

@DriftDatabase(tables: [ReligionTable])
class ReligionDatabase extends _$ReligionDatabase {
  ReligionDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  Future<int> createItem(ReligionTableData item) {
    return into(religionTable).insert(item);
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'religion.sqlite'));

    return NativeDatabase.createInBackground(file);
  });
}
