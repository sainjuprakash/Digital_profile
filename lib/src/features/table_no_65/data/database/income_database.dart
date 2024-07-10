import 'dart:io';

import 'package:digital_profile/src/features/table_no_65/data/table_helper/income_table.dart';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
part 'income_database.g.dart';

@DriftDatabase(tables: [IncomeTable])
class IncomeDatabase extends _$IncomeDatabase {
  IncomeDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  Future<int> createItem(IncomeTableData entry) {
    return into(incomeTable).insert(entry);
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'income.sqlite'));

    return NativeDatabase.createInBackground(file);
  });
}
