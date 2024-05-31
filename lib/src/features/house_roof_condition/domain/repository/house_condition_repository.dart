import '../../data/model/house_condition_model.dart';

abstract class HouseRoofConditionRepository {
  Future<List<HouseConditionModel>> getHomeData(
      String baseUrl, String endPoint);
}
