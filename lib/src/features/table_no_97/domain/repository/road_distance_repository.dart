import 'package:digital_profile/src/features/table_no_97/data/model/road_distance_model.dart';

abstract class RoadDistanceRepository {
  Future<List<RoadDistanceModel>> getRoadData(String baseUrl, String endPoint);
}
