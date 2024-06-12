import '../../data/model/grant_house_model.dart';

abstract class GrantHouseRepository {
  Future<List<GrantHouseModel>> getGrantHousesData(
      String baseUrl, String endPoint);
}
