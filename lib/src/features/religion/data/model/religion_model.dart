import 'package:freezed_annotation/freezed_annotation.dart';

part 'religion_model.freezed.dart';
part 'religion_model.g.dart';

@freezed
class ReligionModel with _$ReligionModel {
  const ReligionModel._();

  factory ReligionModel({
    @JsonKey(name: "survey_ward_no") required int wardNumber,
    @JsonKey(name: "ward_rel_hindu_count") required int? hindu,
    @JsonKey(name: "ward_rel_boudha_count") required int? boudha,
    @JsonKey(name: "ward_rel_christian_count") required int? christian,
    @JsonKey(name: "ward_rel_muslim_count") required int? muslim,
    @JsonKey(name: "ward_rel_kirat_count") required int? kirat,
    @JsonKey(name: "ward_rel_jain_count") required int? jains,
    @JsonKey(name: "ward_rel_bon_count") required int? bon,
    @JsonKey(name: "ward_rel_other_count") required int? others,
    @JsonKey(name: "ward_rel_notavailable_count") required int? notAvailable,
    @JsonKey(name: "total_ward_rel_count") required int? wardRelCount,
  }) = _ReligionModel;

  factory ReligionModel.fromJson(Map<String, dynamic> json) =>
      _$ReligionModelFromJson(json);
}
