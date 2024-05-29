import '../../data/models/ethnicity_model.dart';

abstract class EthnicityRepository {
  Future<List<EthnicityModel>> getEthnicityData(String baseUrl);
}
