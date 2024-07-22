import 'dart:io';

import 'package:digital_profile/src/features/population/data/table_helper/population_table.dart';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

part 'population_database.g.dart';

@DriftDatabase(tables: [PopulationTable])
class PopulationDatabase extends _$PopulationDatabase {
  PopulationDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  Future<int> createItem(PopulationTableData item) {
    return into(populationTable).insert(item);
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'population.sqlite'));

    return NativeDatabase.createInBackground(file);
  });
}
