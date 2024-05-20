import 'package:digital_profile/src/features/home_facilities/data/model/home_facilities_model.dart';

abstract class HomeFacilitiesRepository {
  Future<List<HomeFacilitiesModel>> getHomeFacilities();
}
