import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import '../table_helper/marriage_table.dart';
part 'marriage_database.g.dart';

@DriftDatabase(tables: [MarriageTable])
class MarriageDatabase extends _$MarriageDatabase {
  MarriageDatabase() : super(_openConnection());
  @override
  int get schemaVersion => 1;

  Future<int> createItem(MarriageTableData entry) {
    return into(marriageTable).insert(entry);
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'marriage.sqlite'));

    return NativeDatabase.createInBackground(file);
  });
}
