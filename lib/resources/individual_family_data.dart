import 'package:freezed_annotation/freezed_annotation.dart';

part 'individual_family_data.freezed.dart';
part 'individual_family_data.g.dart';

@freezed
class IndividualFamilyData with _$IndividualFamilyData {
  const IndividualFamilyData._();
  factory IndividualFamilyData({
    @JsonKey(name: "group_family/Name") required String individualName,
    @JsonKey(name: "group_family/Last_name") required String lastName,
    @JsonKey(name: "group_family/Ethnicity") required String ethnicity,
    @JsonKey(name: "group_family/Sex") required String sex,
    @JsonKey(name: "group_family/Relation_HhdHead") required String hhdHead,
    @JsonKey(name: "group_family/Age") required String age,
    @JsonKey(name: "group_family/Language") required String language,
    @JsonKey(name: "group_family/Religion") required String religion,
    @JsonKey(name: "group_family/Marital_status") String? maritalStatus,
    @JsonKey(name: "group_family/Education") required String education,
    @JsonKey(name: "group_family/any_specialist") String? specialist,
    @JsonKey(name: "group_family/Occupation") String? occupation,
    @JsonKey(name: "group_family/_Name_") required String name,
    @JsonKey(name: "group_family/Living_status") required String livinhStatus,
    @JsonKey(name: "group_family/Disability") required String disability,
    @JsonKey(name: "group_family/hlth_condi") required String healthCondition,
  }) = _IndividualFamilyData;

  factory IndividualFamilyData.fromJson(Map<String, dynamic> json) =>
      _$IndividualFamilyDataFromJson(json);
}
