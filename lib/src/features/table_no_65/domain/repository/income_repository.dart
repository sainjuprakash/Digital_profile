import '../../data/model/income_model.dart';

abstract class IncomeRepository {
  Future<List<IncomeModel>> getIncomeData(String baseUrl, String endPoint);
}
