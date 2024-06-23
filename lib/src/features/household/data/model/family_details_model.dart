import 'package:freezed_annotation/freezed_annotation.dart';

import 'individual_family_model.dart';
part 'family_details_model.freezed.dart';
part 'family_details_model.g.dart';

@freezed
class FamilyDetailsModel with _$FamilyDetailsModel {
  const FamilyDetailsModel._();

  factory FamilyDetailsModel({
    @JsonKey(name: "id") required int id,
    @JsonKey(name: "hh_number") required int? houseNumber,
    @JsonKey(name: "survey_ward_no") required String? wardNo,
    @JsonKey(name: "Sett_Name") required String? setName,
    @JsonKey(name: "road") required String? road,
    @JsonKey(name: "road_to_house") required String? roadToHouse,
    @JsonKey(name: "respondent") required String respondent,
    @JsonKey(name: "respondent_mobile") required String? phoneNumber,
    @JsonKey(name: "relation_HhdHead") required String? relationHh,
    @JsonKey(name: "migration_type") required String? migrationType,
    @JsonKey(name: "family_number") required int? familyCount,
    @JsonKey(name: "death") required String? isDeath,
    @JsonKey(name: "death_qty") required int? deathQty,
    @JsonKey(name: "gps_longitude") required String? latitude,
    @JsonKey(name: "gps_latitude") required String? longitude,
    @JsonKey(name: "families")
    required List<IndividualFamilyData> individualData,
  }) = _FamilyDetailsModel;

  factory FamilyDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$FamilyDetailsModelFromJson(json);
}
