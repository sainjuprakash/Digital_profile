import 'package:digital_profile/src/features/table_%20no_30/data/model/house_ownership_model.dart';

abstract class HouseOwnershipRepository {
  Future<List<HouseOwnershipModel>> getHouseOwnershipData(String baseUrl, String endPoint);
}
