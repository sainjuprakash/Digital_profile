import 'package:digital_profile/src/features/ethenicity/data/models/ethnicity_model.dart';

abstract class EthnicityRepository {
  Future<List<EthnicityModel>> getEthnicityData();
}
