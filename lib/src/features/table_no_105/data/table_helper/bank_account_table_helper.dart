import 'package:digital_profile/src/features/table_no_105/data/database/bank_account_database.dart';

final db = BankAccountDatabase();

Future<int?> addBankAccountData(BankAccountTableData entry) async {
  db.createItem(entry);
}

Future<List<BankAccountTableData>> getAllBankData() async {
  try {
    List<BankAccountTableData> bankData =
        await db.select(db.bankAccountTable).get();
    return bankData;
  } catch (errMsg) {
    throw Exception(errMsg);
  }
}
