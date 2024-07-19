
import 'package:digital_profile/src/features/table_no_95/data/database/allowance_database.dart';

final db = AllowanceDatabase();

Future<int?> addAllowanceData(AllowanceTableData entry) async {
  db.createItem(entry);
}

Future<List<AllowanceTableData>> getAllAllowanceData() async {
  try {
    List<AllowanceTableData> allowanceData =
        await db.select(db.allowanceTable).get();
    return allowanceData;
  } catch (errMsg) {
    throw Exception(errMsg);
  }
}
Future<void> clearAllowanceData() async {
  final allTables = db.allTables;
  await db.transaction(() async {
    for (var table in allTables) {
      await db.delete(table).go();
    }
  });
}
