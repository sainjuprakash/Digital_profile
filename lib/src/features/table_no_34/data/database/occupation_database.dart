import 'dart:io';

import 'package:digital_profile/src/features/table_no_34/data/table_helper/occupation_table.dart';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
part 'occupation_database.g.dart';

@DriftDatabase(tables: [OccupationTable])
class OccupationDatabase extends _$OccupationDatabase{
  OccupationDatabase() : super(_openConnection());


  @override
  int get schemaVersion => 1;

  Future<int> createItem(OccupationTableData entry){
    return into(occupationTable).insert(entry);
  }
}
LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'occupation.sqlite'));

    return NativeDatabase.createInBackground(file);
  });
}