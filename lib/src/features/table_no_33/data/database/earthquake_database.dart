import 'dart:io';
import 'package:digital_profile/src/features/table_no_33/data/table_helper/earthquake_table.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;

import 'package:drift/drift.dart';
import 'package:path_provider/path_provider.dart';
part 'earthquake_database.g.dart';

@DriftDatabase(tables: [EarthquakeTable])
class EarthquakeDatabase extends _$EarthquakeDatabase {
  EarthquakeDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  Future<int> createItem(EarthquakeTableData entry) {
    return into(earthquakeTable).insert(entry);
  }
}
LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'earthquakeRes.sqlite'));

    return NativeDatabase.createInBackground(file);
  });
}