import 'package:digital_profile/src/features/toilet/data/table_helper/toilet_table.dart';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'dart:io';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
part 'toilet_database.g.dart';

@DriftDatabase(tables: [ToiletTable])
class ToiletDatabase extends _$ToiletDatabase {
  ToiletDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  Future<int> createItem(ToiletTableData entry) {
    return into(toiletTable).insert(entry);
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'toilet.sqlite'));

    return NativeDatabase.createInBackground(file);
  });
}
