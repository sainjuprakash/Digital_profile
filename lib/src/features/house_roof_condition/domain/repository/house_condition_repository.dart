
import '../../data/model/house_condition_model.dart';

abstract class HouseConditionRepository {
  Future<List<HouseConditionModel>> getHomeData();
}
