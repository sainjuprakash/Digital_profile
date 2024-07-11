import 'package:digital_profile/src/features/table_no_95/data/table_helper/allowance_table.dart';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'dart:io';

import 'package:path_provider/path_provider.dart';
part 'allowance_database.g.dart';

@DriftDatabase(tables: [AllowanceTable])
class AllowanceDatabase extends _$AllowanceDatabase {
  AllowanceDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  Future<int> createItem(AllowanceTableData entry) {
    return into(allowanceTable).insert(entry);
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'allowance.sqlite'));

    return NativeDatabase.createInBackground(file);
  });
}
