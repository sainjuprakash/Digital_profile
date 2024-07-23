import 'package:drift/drift.dart';

class BankTable extends Table {
  TextColumn get villageName => text()();
  IntColumn get wardNumber => integer()();
  IntColumn get bankAccount => integer().nullable()();
  IntColumn get noBankAccount => integer().nullable()();
  IntColumn get wardHouses => integer().nullable()();
  IntColumn get totalBankAccount => integer().nullable()();
}
