import 'package:digital_profile/src/features/table_no_114/data/table_helper/grant_stage_table.dart';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:path/path.dart' as p;
part 'grant_stage_database.g.dart';

@DriftDatabase(tables: [GrantStageTable])
class GrantStageDatabase extends _$GrantStageDatabase {
  GrantStageDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  Future<int> createItem(GrantStageTableData entry) {
    return into(grantStageTable).insert(entry);
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'grantStage.sqlite'));

    return NativeDatabase.createInBackground(file);
  });
}
