import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';

import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import '../table_helper/health_condition_table.dart';
part 'health_condition_database.g.dart';

@DriftDatabase(tables: [HealthConditionTable])
class HealthConditionDatabase extends _$HealthConditionDatabase {
  HealthConditionDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  Future<int> createItem(HealthConditionTableData entry) {
    return into(healthConditionTable).insert(entry);
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'healthCondition.sqlite'));

    return NativeDatabase.createInBackground(file);
  });
}
