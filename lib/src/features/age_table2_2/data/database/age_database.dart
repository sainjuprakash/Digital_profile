import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:digital_profile/src/features/age_table2_2/data/table_helper/age_table.dart';
part 'age_database.g.dart';

@DriftDatabase(tables: [AgeTable])
class AgeDatabase extends _$AgeDatabase {
  AgeDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  Future<int> createItem(AgeTableData item) {
    return into(ageTable).insert(item);
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'age.sqlite'));

    return NativeDatabase.createInBackground(file);
  });
}
