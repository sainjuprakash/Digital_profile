import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'dart:io';

import '../table_helper/electricity_table.dart';
part 'electricity_database.g.dart';

@DriftDatabase(tables: [ElectricityTable])
class ElectricityDatabase extends _$ElectricityDatabase {
  ElectricityDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  Future<int> createItem(ElectricityTableData entry) {
    return into(electricityTable).insert(entry);
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'electricity.sqlite'));

    return NativeDatabase.createInBackground(file);
  });
}
