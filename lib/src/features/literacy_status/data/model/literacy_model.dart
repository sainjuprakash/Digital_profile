import 'package:freezed_annotation/freezed_annotation.dart';

part 'literacy_model.freezed.dart';
part 'literacy_model.g.dart';

@freezed
class LiteracyModel with _$LiteracyModel {
  const LiteracyModel._();
  factory LiteracyModel({
    @JsonKey(name: "survey_ward_no") required int wardNumber,
    @JsonKey(name: "ward_m_literate_count") required int? maleLiterate,
    @JsonKey(name: "ward_m_preprimary_count") required int? malePrePrimary,
    @JsonKey(name: "ward_m_primary_count") required int? malePrimary,
    @JsonKey(name: "ward_m_secondary_count") required int? maleSecondary,
    @JsonKey(name: "ward_m_technical_count") required int? maleTechnical,
    @JsonKey(name: "ward_m_bachelor_count") required int? maleBachelor,
    @JsonKey(name: "ward_m_masters_count") required int? maleMasters,
    @JsonKey(name: "ward_m_mphil_count") required int? maleMphil,
    @JsonKey(name: "ward_m_underage_count") required int? maleUnderAge,
    @JsonKey(name: "ward_m_iliterate_count") required int? maleIlitrate,
    @JsonKey(name: "ward_m_not_available_count") required int? maleNotAvailable,
    @JsonKey(name: "ward_female_literate_count") required int? femaleLiterate,
    @JsonKey(name: "ward_female_preprimary_count")
    required int? femalePrePrimary,
    @JsonKey(name: "ward_female_primary_count") required int? femalePrimary,
    @JsonKey(name: "ward_female_secondary_count") required int? femaleSecondary,
    @JsonKey(name: "ward_female_technical_count") required int? femaleTechincal,
    @JsonKey(name: "ward_female_bachelor_count") required int? femaleBachelor,
    @JsonKey(name: "ward_female_masters_count") required int? femaleMasters,
    @JsonKey(name: "ward_female_mphil_count") required int? femaleMphil,
    @JsonKey(name: "ward_female_underage_count") required int? femaleUnderAge,
    @JsonKey(name: "ward_female_iliterate_count") required int? femaleIliterate,
    @JsonKey(name: "ward_female_not_available_count")
    required int? femaleNotAvailable,
    @JsonKey(name: "ward_f_literate_count") required int? othersLiterate,
    @JsonKey(name: "ward_f_preprimary_count") required int? othersPrePrimary,
    @JsonKey(name: "ward_f_primary_count") required int? othersPrimary,
    @JsonKey(name: "ward_f_secondary_count") required int? othersSecondary,
    @JsonKey(name: "ward_f_technical_count") required int? othersTechnical,
    @JsonKey(name: "ward_f_bachelor_count") required int? othersBachelor,
    @JsonKey(name: "ward_f_masters_count") required int? othersMasters,
    @JsonKey(name: "ward_f_mphil_count") required int? othersMphil,
    @JsonKey(name: "ward_f_underage_count") required int? othersUnderAge,
    @JsonKey(name: "ward_f_iliterate_count") required int? othersIliterate,
    @JsonKey(name: "ward_f_not_available_count")
    required int? othersNotAvailable,
    @JsonKey(name: "total_ward_edu_count") required int? totalWardEdu,
  }) = _LiteracyModel;

  factory LiteracyModel.fromJson(Map<String, dynamic> json) =>
      _$LiteracyModelFromJson(json);
}
