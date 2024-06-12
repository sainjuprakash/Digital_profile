import '../../data/model/grant_stage_model.dart';

abstract class GrantStageRepository {
  Future<List<GrantStageModel>> getGrantData(String baseUrl, String endPoint);
}
