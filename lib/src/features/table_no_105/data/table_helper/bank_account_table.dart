import 'package:drift/drift.dart';

class BankAccountTable extends Table {
  IntColumn get wardNumber => integer()();
  IntColumn get devBank => integer().nullable()();
  IntColumn get commercialBank => integer().nullable()();
  IntColumn get sahakari => integer().nullable()();
  IntColumn get bitiyaSanstha => integer().nullable()();
  IntColumn get notAvailable => integer().nullable()();
  IntColumn get total => integer().nullable()();
  IntColumn get totalBankCount => integer().nullable()();
}
