import 'dart:io';
import 'package:digital_profile/src/features/table_no_112/data/table_helper/earthquake_damage_table.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:drift/drift.dart';
import 'package:path_provider/path_provider.dart';
part 'earthquake_damage_database.g.dart';

@DriftDatabase(tables: [EarthquakeDamageTable])
class EarthquakeDamageDatabase extends _$EarthquakeDamageDatabase {
  EarthquakeDamageDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  Future<int> createItem(EarthquakeDamageTableData entry) {
    return into(earthquakeDamageTable).insert(entry);
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'earthquakeDamage.sqlite'));

    return NativeDatabase.createInBackground(file);
  });
}
