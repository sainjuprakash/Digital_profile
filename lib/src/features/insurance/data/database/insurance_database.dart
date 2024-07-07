import 'package:digital_profile/src/features/insurance/data/table_helper/insurance_table.dart';
import 'package:drift/drift.dart';
import 'dart:io';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
part 'insurance_database.g.dart';

@DriftDatabase(tables: [InsuranceTable])
class InsuranceDatabase extends _$InsuranceDatabase {
  InsuranceDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  Future<int> createItem(InsuranceTableData entry) {
    return into(insuranceTable).insert(entry);
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'insurance.sqlite'));

    return NativeDatabase.createInBackground(file);
  });
}
