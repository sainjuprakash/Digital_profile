import 'package:freezed_annotation/freezed_annotation.dart';

part 'language_model.freezed.dart';
part 'language_model.g.dart';

@freezed
class LanguageModel with _$LanguageModel {
  const LanguageModel._();

  factory LanguageModel({
    @JsonKey(name: "survey_ward_no") required String? wardNo,
    @JsonKey(name: "ward_lang_nep_count") required String? nepali,
    @JsonKey(name: "ward_lang_tamang_count") required String? tamang,
    @JsonKey(name: "ward_lang_sherpa_count") required String? sherpa,
    @JsonKey(name: "ward_lang_limbu_count") required String? limbu,
    @JsonKey(name: "ward_lang_rai_count") required String? rai,
    @JsonKey(name: "ward_lang_gurung_count") required String? gurung,
    @JsonKey(name: "ward_lang_ghale_count") required String? ghale,
    @JsonKey(name: "ward_lang_other_count") required String? othersLanguage,
    @JsonKey(name: "ward_lang_not_available_count")
    required String? notAvailable,
    @JsonKey(name: "total_ward_lang_count") required String? totalLanguageCount,
  }) = _LanguageModel;

  factory LanguageModel.fromJson(Map<String, dynamic> json) =>
      _$LanguageModelFromJson(json);
}
