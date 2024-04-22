import 'package:freezed_annotation/freezed_annotation.dart';

import 'individual_family_data.dart';

part 'family_details.freezed.dart';
part 'family_details.g.dart';

@freezed
class FamilyDetailsModel with _$FamilyDetailsModel {
  const FamilyDetailsModel._();

  factory FamilyDetailsModel({
    @JsonKey(name: "_id") required int id,
    @JsonKey(name: "group_settlement/survey_ward_no") required String wardNo,
    @JsonKey(name: "group_settlement/Sett_Name") required String setName,
    @JsonKey(name: "group_settlement/Road") required String road,
    @JsonKey(name: "group_settlement/road_to_house")
    required String roadToHouse,
    @JsonKey(name: "group_repondent/Respondent") required String respondent,
    @JsonKey(name: "group_repondent/respondent_mobile")
    required String phoneNumber,
    @JsonKey(name: "group_repondent/Relation") required String relation,
    @JsonKey(name: "group_repondent/migration_type")
    required String migrationType,
    @JsonKey(name: "group_repondent/Family_number") required String familyCount,
    @JsonKey(name: "group_deathqty/Death") required String isDeath,
    @JsonKey(name: "group_insu/Insurance") required String insurance,
    @JsonKey(name: "group_family")
    required List<IndividualFamilyData> individualData,
  }) = _FamilyDetailsModel;

  factory FamilyDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$FamilyDetailsModelFromJson(json);
}
