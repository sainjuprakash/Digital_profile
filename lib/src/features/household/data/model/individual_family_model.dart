import 'package:freezed_annotation/freezed_annotation.dart';

part 'individual_family_model.freezed.dart';
part 'individual_family_model.g.dart';

@freezed
class IndividualFamilyData with _$IndividualFamilyData {
  const IndividualFamilyData._();
  factory IndividualFamilyData({
    @JsonKey(name: "name") required String? individualName,
    @JsonKey(name: "last_name") required String? lastName,
    @JsonKey(name: "ethnicity") required String? ethnicity,
    @JsonKey(name: "sex") required String? sex,
    @JsonKey(name: "relation") required String? relationHhHead,
    @JsonKey(name: "age") required String? age,
    @JsonKey(name: "language") required String? language,
    @JsonKey(name: "marital_status") required String? maritalStatus,
    @JsonKey(name: "education") required String? education,
    @JsonKey(name: "any_specialist") required String? specialist,
    @JsonKey(name: "occupation") required String? occupation,
    @JsonKey(name: "living_status") required String? livingStatus,
    @JsonKey(name: "disability") required String? disability,
    @JsonKey(name: "health_condition") required String? healthCondition,
  }) = _IndividualFamilyData;

  factory IndividualFamilyData.fromJson(Map<String, dynamic> json) =>
      _$IndividualFamilyDataFromJson(json);
}
