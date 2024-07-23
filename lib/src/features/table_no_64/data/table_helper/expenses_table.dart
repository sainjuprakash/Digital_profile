import 'package:drift/drift.dart';

class ExpensesTable extends Table {
  TextColumn get villageName => text()();
  IntColumn get wardNumber => integer()();
  IntColumn get clothes => integer().nullable()();
  IntColumn get education => integer().nullable()();
  IntColumn get health => integer().nullable()();
  IntColumn get festival => integer().nullable()();
  IntColumn get agriculture => integer().nullable()();
  IntColumn get others => integer().nullable()();
  IntColumn get totalExpenses => integer().nullable()();
}
