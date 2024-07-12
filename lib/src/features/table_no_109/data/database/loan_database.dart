import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'dart:io';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import '../table_helper/loan_table.dart';
part 'loan_database.g.dart';

@DriftDatabase(tables: [LoanTable])
class LoanDatabase extends _$LoanDatabase {
  LoanDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  Future<int> createItem(LoanTableData entry) {
    return into(loanTable).insert(entry);
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'loan.sqlite'));

    return NativeDatabase.createInBackground(file);
  });
}
