import 'dart:io';
import 'package:digital_profile/src/features/table_%20no_30/data/table_helper/house_ownership_table.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;

import 'package:drift/drift.dart';
import 'package:path_provider/path_provider.dart';
part 'house_ownership_database.g.dart';
@DriftDatabase(tables: [OwnershipTable])
class OwnershipDatabase extends _$OwnershipDatabase {
  OwnershipDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  Future<int> createItem(OwnershipTableData entry) async {
    return into(ownershipTable).insert(entry);
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'houseOwnership.sqlite'));

    return NativeDatabase.createInBackground(file);
  });
}
