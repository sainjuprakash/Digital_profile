import '../../data/model/loan_model.dart';

abstract class LoanRepository {
  Future<List<LoanModel>> getLoanData(String baseUrl, String endPoint);
}
