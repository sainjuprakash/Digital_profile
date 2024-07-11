import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'dart:io';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import '../table_helper/road_distance_table.dart';
part 'road_distance_database.g.dart';

@DriftDatabase(tables: [RoadDistanceTable])
class RoadDistanceDatabase extends _$RoadDistanceDatabase {
  RoadDistanceDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  Future<int> createItem(RoadDistanceTableData entry) {
    return into(roadDistanceTable).insert(entry);
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'roadDistance.sqlite'));

    return NativeDatabase.createInBackground(file);
  });
}
