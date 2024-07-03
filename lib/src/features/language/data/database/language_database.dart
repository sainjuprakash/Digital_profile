import 'dart:io';

import 'package:digital_profile/src/features/language/data/table_helper/language_table.dart';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;

import 'package:path_provider/path_provider.dart';

part 'language_database.g.dart';

@DriftDatabase(tables: [LanguageTable])
class LanguageDatabase extends _$LanguageDatabase {
  LanguageDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  Future<int> createItem(LanguageTableData item) {
    return into(languageTable).insert(item);
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'language.sqlite'));

    return NativeDatabase.createInBackground(file);
  });
}
