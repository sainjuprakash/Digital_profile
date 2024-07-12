import 'dart:io';
import 'package:digital_profile/src/features/table_no_113/data/table_helper/earthquake_grant_table.dart';
import 'package:path/path.dart' as p;
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
part 'earthquake_grant_database.g.dart';

@DriftDatabase(tables: [EarthquakeGrantTable])
class EarthquakeGrantDatabase extends _$EarthquakeGrantDatabase {
  EarthquakeGrantDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  Future<int> createItem(EarthquakeGrantTableData entry) {
    return into(earthquakeGrantTable).insert(entry);
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'earthquakeGrant.sqlite'));

    return NativeDatabase.createInBackground(file);
  });
}
