import 'package:digital_profile/src/features/table_no_109/data/database/loan_database.dart';

final db = LoanDatabase();

Future<int?> addLoanData(LoanTableData entry) async {
  db.createItem(entry);
}

Future<List<LoanTableData>> getAllLoanData() async {
  try {
    List<LoanTableData> loanData = await db.select(db.loanTable).get();
    return loanData;
  } catch (errMsg) {
    throw Exception(errMsg);
  }
}
