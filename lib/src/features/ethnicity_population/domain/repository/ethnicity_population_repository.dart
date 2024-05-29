import 'package:digital_profile/src/features/ethnicity_population/data/model/ethnicity_population_model.dart';

abstract class EthnicityPopulationRepository {
  Future<List<EthnicityPopulationModel>> getEthnicityPopulation(String baseUrl);
}
