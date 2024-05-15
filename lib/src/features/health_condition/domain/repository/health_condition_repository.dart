import '../../data/model/health_condition_model.dart';

abstract class HealthConditionRepository {
  Future<List<HealthConditionModel>> getHealthCondition();
}
