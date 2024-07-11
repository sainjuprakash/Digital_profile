import 'dart:io';

import 'package:digital_profile/src/features/table_no_100/data/table_helper/child_worker_table.dart';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
part 'child_worker_database.g.dart';

@DriftDatabase(tables: [ChildWorkerTable])
class ChildWorkerDatabase extends _$ChildWorkerDatabase{
  ChildWorkerDatabase(): super(_openConnection());

  @override
  int get schemaVersion => 1;

  Future<int> createItem(ChildWorkerTableData entry){
    return into(childWorkerTable).insert(entry);
  }
}


LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'childWorker.sqlite'));

    return NativeDatabase.createInBackground(file);
  });
}
