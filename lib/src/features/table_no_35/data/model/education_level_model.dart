import 'package:freezed_annotation/freezed_annotation.dart';

part 'education_level_model.freezed.dart';
part 'education_level_model.g.dart';

@freezed
class EducationModel with _$EducationModel {
  EducationModel._();

  factory EducationModel({
    @JsonKey(name: "survey_ward_no") required int wardNumber,
    @JsonKey(name: "ward_f_edu_preprimary_count") required int? othersPrePrimary,
    @JsonKey(name: "ward_f_edu_primary_count") required int? othersPrimary,
    @JsonKey(name: "ward_f_edu_secondary_count") required int? othersSecondary,
    @JsonKey(name: "ward_f_edu_bachelor_count") required int? othersBachelor,
    @JsonKey(name: "ward_f_edu_masters_count") required int? othersMasters,
    @JsonKey(name: "ward_f_edu_mphil_count") required int? othersMphil,
    @JsonKey(name: "ward_f_edu_underage_count") required int? othersUnderAge,
    @JsonKey(name: "ward_f_edu_iliterate_count") required int? othersIliterate,
    @JsonKey(name: "ward_f_edu_not_available_count")
    required int? othersNotAvailable,
    @JsonKey(name: "total_ward_edu_count") required int? totalWardEdu,

}) = _EducationModel;

  factory EducationModel.fromJson(Map<String, dynamic> json) => _$EducationModelFromJson(json);
}
