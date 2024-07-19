import 'package:digital_profile/src/features/table_no_74/data/database/settlement_database.dart';

final db = SettlementDatabase();

Future<int?> addSettlementData(SettlementTableData entry) async {
  await db.createItem(entry);
}

Future<List<SettlementTableData>> getAllSettlementData() async {
  try {
    List<SettlementTableData> settlementData =
        await db.select(db.settlementTable).get();
    return settlementData;
  } catch (errMsg) {
    throw Exception(errMsg);
  }
}
Future<void> clearSettlementData() async {
  final allTables = db.allTables;
  await db.transaction(() async {
    for (var table in allTables) {
      await db.delete(table).go();
    }
  });
}
