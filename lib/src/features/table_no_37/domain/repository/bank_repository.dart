import '../../data/model/bank_model.dart';

abstract class BankRepository {
  Future<List<BankModel>> getBankData(String baseUrl, String endPoint);
}
