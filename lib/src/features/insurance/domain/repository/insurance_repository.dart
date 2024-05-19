import 'package:digital_profile/src/features/insurance/data/model/insurance_model.dart';

abstract class InsuranceRepository {
  Future<List<InsuranceModel>> getInsuranceData();
}
