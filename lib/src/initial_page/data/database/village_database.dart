import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import '../table_helper/village_table.dart';
part 'village_database.g.dart';

@DriftDatabase(tables: [VillageTable])
class VillageDatabase extends _$VillageDatabase {
  VillageDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  Future<int> createItem(VillageTableData entry) {
    return into(villageTable).insert(entry);
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'village.sqlite'));

    return NativeDatabase.createInBackground(file);
  });
}

@DriftAccessor(tables: [VillageTable])
class VillageDao extends DatabaseAccessor<VillageDatabase>
    with _$VillageDaoMixin {
  final VillageDatabase db;
  VillageDao(this.db) : super(db);

  Future<void> insertVillage(String value) => into(villageTable)
      .insert(VillageTableCompanion(villageName: Value(value)));
  Future<void> insertVillages(List<String> values) async {
    for (var value in values) {
      await insertVillage(value);
    }
  }
}
