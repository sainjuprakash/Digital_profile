import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

import '../table_helper/ethnicity_population_table.dart';
part 'ethnicity_population_database.g.dart';

@DriftDatabase(tables: [EthnicityPopTable])
class EthnicityPopDatabase extends _$EthnicityPopDatabase {
  EthnicityPopDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  Future<int> createItem(EthnicityPopTableData item) {
    return into(ethnicityPopTable).insert(item);
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'ethnicityPop.sqlite'));

    return NativeDatabase.createInBackground(file);
  });
}
