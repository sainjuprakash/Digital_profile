import '../../data/model/disability_model.dart';

abstract class DisabilityRepository {
  Future<List<DisabilityModel>> getDisabilityData(
      String baseUrl, String endPoints);
}
