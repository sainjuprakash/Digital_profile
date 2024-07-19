import 'package:digital_profile/src/features/table_no_64/data/database/expenses_database.dart';

final db = ExpensesDatabase();
Future<int?> addExpensesData(ExpensesTableData entry) async {
  await db.createItem(entry);
}

Future<List<ExpensesTableData>> getAllExpensesData() async {
  try {
    List<ExpensesTableData> expensesData =
        await db.select(db.expensesTable).get();
    return expensesData;
  } catch (errMsg) {
    throw Exception(errMsg);
  }
}
Future<void> clearExpensesData() async {
  final allTables = db.allTables;
  await db.transaction(() async {
    for (var table in allTables) {
      await db.delete(table).go();
    }
  });
}
