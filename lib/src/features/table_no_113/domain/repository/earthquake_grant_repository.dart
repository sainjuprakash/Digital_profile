import 'package:digital_profile/src/features/table_no_113/data/model/earthquake_grant_model.dart';

abstract class EarthquakeGrantRepository {
  Future<List<EarthquakeGrantModel>> getEarthquakeGrantData(
      String baseUrl, String endPoint);
}
