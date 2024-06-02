import '../../data/model/occupation_model.dart';

abstract class OccupationRepository {
  Future<List<OccupationModel>> getOccupationData(
      String baseUrl, String endPoint);
}
