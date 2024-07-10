import 'dart:io';

import 'package:digital_profile/src/features/table_no_45/data/table_helper/meat_table.dart';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
part 'meat_database.g.dart';

@DriftDatabase(tables: [MeatTable])
class MeatDatabase extends _$MeatDatabase {
  MeatDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  Future<int> createItem(MeatTableData entry) {
    return into(meatTable).insert(entry);
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'meat.sqlite'));

    return NativeDatabase.createInBackground(file);
  });
}
