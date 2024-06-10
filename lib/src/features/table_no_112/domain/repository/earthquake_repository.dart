import '../../data/model/earthquake_model.dart';

abstract class EarthquakeRepository {
  Future<List<EarthquakeModel>> getEarthquakeData(
      String baseUrl, String endPoint);
}
