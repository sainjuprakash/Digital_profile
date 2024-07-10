import 'package:digital_profile/src/features/table_no_37/data/database/bank_database.dart';

final db = BankDatabase();

Future<int?> addBank(BankTableData entry) async {
  await db.createItem(entry);
}

Future<List<BankTableData>> getAllBankDetails() async {
  try {
    List<BankTableData> bankData = await db.select(db.bankTable).get();
    return bankData;
  } catch (errMsg) {
    throw Exception(errMsg);
  }
}
