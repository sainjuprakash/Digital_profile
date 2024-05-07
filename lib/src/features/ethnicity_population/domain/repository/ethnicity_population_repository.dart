import 'package:digital_profile/src/features/ethnicity_population/data/model/ethnicity_population.dart';

abstract class EthnicityPopulationRepository {
  Future<List<EthnicityPopulationModel>> getEthnicityPopulation();
}
