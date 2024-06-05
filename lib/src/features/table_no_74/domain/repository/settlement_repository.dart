import 'package:digital_profile/src/features/table_no_74/data/model/settlement_model.dart';

abstract class SettlementRepository {
  Future<List<SettlementModel>> getSettlementData(
      String baseUrl, String endPoint);
}
