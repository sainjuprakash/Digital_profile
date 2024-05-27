import 'package:digital_profile/src/features/house_condition/data/model/house_condition_model.dart';

abstract class HouseConditionRepository {
  Future<List<HouseConditionModel>> getHomeData();
}
