import 'dart:io';

import 'package:digital_profile/src/features/table_no_37/data/table_helper/bank_table.dart';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
part 'bank_database.g.dart';

@DriftDatabase(tables: [BankTable])
class BankDatabase extends _$BankDatabase {
  BankDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  Future<int> createItem(BankTableData entry) {
    return into(bankTable).insert(entry);
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'occupation.sqlite'));

    return NativeDatabase.createInBackground(file);
  });
}
