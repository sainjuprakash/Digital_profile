import 'dart:io';

import 'package:digital_profile/src/features/table_no_64/data/table_helper/expenses_table.dart';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
part 'expenses_database.g.dart';

@DriftDatabase(tables: [ExpensesTable])
class ExpensesDatabase extends _$ExpensesDatabase {
  ExpensesDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  Future<int> createItem(ExpensesTableData entry){
    return into(expensesTable).insert(entry);
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'expenses.sqlite'));

    return NativeDatabase.createInBackground(file);
  });
}
