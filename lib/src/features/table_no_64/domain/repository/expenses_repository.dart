import '../../data/model/expenses_model.dart';

abstract class ExpensesRepository {
  Future<List<ExpensesModel>> getExpensesData(String baseUrl, String endPoint);
}
