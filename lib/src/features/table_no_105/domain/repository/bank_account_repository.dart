import 'package:digital_profile/src/features/table_no_105/data/model/bank_account_model.dart';

abstract class BankAccountRepository {
  Future<List<BankAccountModel>> getBankDetails(
      String baseUrl, String endPoint);
}
