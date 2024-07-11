import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

import '../table_helper/bank_account_table.dart';
part 'bank_account_database.g.dart';

@DriftDatabase(tables: [BankAccountTable])
class BankAccountDatabase extends _$BankAccountDatabase {
  BankAccountDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  Future<int> createItem(BankAccountTableData entry) {
    return into(bankAccountTable).insert(entry);
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'bankAccount.sqlite'));

    return NativeDatabase.createInBackground(file);
  });
}
