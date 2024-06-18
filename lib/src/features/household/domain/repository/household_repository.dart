import 'package:digital_profile/src/features/household/data/model/family_details_model.dart';

abstract class HouseholdRepository {
  Future<List<FamilyDetailsModel>> getFamilyDetails(String houseHoldUrl);
}
