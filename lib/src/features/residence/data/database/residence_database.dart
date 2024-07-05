import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import '../table_helper/residence_table.dart';
part 'residence_database.g.dart';

@DriftDatabase(tables: [ResidenceTable])
class ResidenceDatabase extends _$ResidenceDatabase {
  ResidenceDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  Future<int> createItem(ResidenceTableData entry) {
    return into(residenceTable).insert(entry);
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'residence.sqlite'));

    return NativeDatabase.createInBackground(file);
  });
}
