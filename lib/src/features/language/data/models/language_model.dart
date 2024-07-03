import 'package:freezed_annotation/freezed_annotation.dart';

part 'language_model.freezed.dart';
part 'language_model.g.dart';

@freezed
class LanguageModel with _$LanguageModel {
  const LanguageModel._();

  factory LanguageModel({
    @JsonKey(name: "survey_ward_no") required int wardNo,
    @JsonKey(name: "ward_lang_nep_count") required int? nepali,
    @JsonKey(name: "ward_lang_tamang_count") required int? tamang,
    @JsonKey(name: "ward_lang_sherpa_count") required int? sherpa,
    @JsonKey(name: "ward_lang_limbu_count") required int? limbu,
    @JsonKey(name: "ward_lang_rai_count") required int? rai,
    @JsonKey(name: "ward_lang_gurung_count") required int? gurung,
    @JsonKey(name: "ward_lang_ghale_count") required int? ghale,
    @JsonKey(name: "ward_lang_other_count") required int? othersLanguage,
    @JsonKey(name: "ward_lang_not_available_count")
    required int? notAvailable,
    @JsonKey(name: "total_ward_lang_count") required int? totalLanguageCount,
  }) = _LanguageModel;

  factory LanguageModel.fromJson(Map<String, dynamic> json) =>
      _$LanguageModelFromJson(json);
}
