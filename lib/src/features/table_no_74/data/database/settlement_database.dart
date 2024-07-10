import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import '../table_helper/settlement_table.dart';
part 'settlement_database.g.dart';

@DriftDatabase(tables: [SettlementTable])
class SettlementDatabase extends _$SettlementDatabase {
  SettlementDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  Future<int> createItem(SettlementTableData entry) {
    return into(settlementTable).insert(entry);
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'settlement.sqlite'));

    return NativeDatabase.createInBackground(file);
  });
}
