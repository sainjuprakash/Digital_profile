import 'package:digital_profile/src/features/table_no_105/data/database/bank_account_database.dart';

final db = BankAccountDatabase();

Future<int?> addBankAccountData(BankAccountTableData entry) async {
  db.createItem(entry);
}

Future<List<BankAccountTableData>> getAllBankAccountData() async {
  try {
    List<BankAccountTableData> bankData =
        await db.select(db.bankAccountTable).get();
    return bankData;
  } catch (errMsg) {
    throw Exception(errMsg);
  }
}
Future<void> clearBankAccountData() async {
  final allTables = db.allTables;
  await db.transaction(() async {
    for (var table in allTables) {
      await db.delete(table).go();
    }
  });
}
