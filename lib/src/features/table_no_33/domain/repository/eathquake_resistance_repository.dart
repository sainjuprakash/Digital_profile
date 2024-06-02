import 'package:digital_profile/src/features/table_no_33/data/model/earthquake_resistance_model.dart';

abstract class EarthquakeResistanceRepository {
  Future<List<EarthquakeResistanceModel>> getResistanceData(String baseUrl, String endPoint);
}
