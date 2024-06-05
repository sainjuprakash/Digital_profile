import 'package:digital_profile/src/features/table_no_95/data/model/allowance_model.dart';

abstract class AllowanceRepository {
  Future<List<AllowanceModel>> getAllowanceData(
      String baseUrl, String endPoint);
}
