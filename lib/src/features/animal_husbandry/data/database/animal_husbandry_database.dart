import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'dart:io';

import 'package:path_provider/path_provider.dart';
import '../table_helper/animal_husbandry_table.dart';
part 'animal_husbandry_database.g.dart';

@DriftDatabase(tables: [AnimalTable])
class AnimalDatabase extends _$AnimalDatabase {
  AnimalDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  Future<int> createItem(AnimalTableData entry) {
    return into(animalTable).insert(entry);
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'animalHb.sqlite'));

    return NativeDatabase.createInBackground(file);
  });
}
