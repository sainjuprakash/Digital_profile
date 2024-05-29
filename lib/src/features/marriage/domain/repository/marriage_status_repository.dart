import '../../data/model/marriage_status_model.dart';

abstract class MarriageRepository {
  Future<List<MarriageStatusModel>> getMarriageData(String baseUrl, String endPoints);
}
