import 'package:digital_profile/src/features/electricity/data/model/electricity_model.dart';

abstract class ElectricityRepository {
  Future<List<ElectricityModel>> getElectricityData(
      String baseUrl, String endPoint);
}
