
import 'package:digital_profile/src/features/table_no_65/data/database/income_database.dart';

final db = IncomeDatabase();
Future<int?> addIncomeData(IncomeTableData entry) async {
  await db.createItem(entry);
}

Future<List<IncomeTableData>> getAllIncomeData() async {
  try {
    List<IncomeTableData> incomeData = await db.select(db.incomeTable).get();
    return incomeData;
  } catch (errMsg) {
    throw Exception(errMsg);
  }
}
Future<void> clearIncomeData() async {
  final allTables = db.allTables;
  await db.transaction(() async {
    for (var table in allTables) {
      await db.delete(table).go();
    }
  });
}
