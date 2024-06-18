import 'package:digital_profile/src/features/age_table2_2/data/model/population_acc_age.dart';

abstract class AgeRepository {
  Future<List<AgePopulationModel>> getAgeData(String baseUrl,String endPoint);
}
