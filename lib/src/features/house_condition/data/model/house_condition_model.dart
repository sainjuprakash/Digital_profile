import 'package:freezed_annotation/freezed_annotation.dart';

part 'house_condition_model.freezed.dart';
part 'house_condition_model.g.dart';

@freezed
class HouseConditionModel with _$HouseConditionModel{
  HouseConditionModel._();

  factory HouseConditionModel({
    @JsonKey(name: "survey_ward_no") required int wardNumber,
    @JsonKey(name: "ward_f_roof_khar_count") required int? khar,
    @JsonKey(name: "ward_f_roof_jasta_count") required int? jasta,
    @JsonKey(name: "ward_f_roof_tial_stone_count") required int? stoneTile,
    @JsonKey(name: "ward_f_roof_rcc_count") required int? rcc,
    @JsonKey(name: "ward_f_roof_wood_count") required int? wood,
    @JsonKey(name: "ward_f_roof_mud_count") required int? mud,
    @JsonKey(name: "ward_f_roof_other_count") required int? others,
    @JsonKey(name: "ward_f_not_available_count") required int? notAvailable,
    @JsonKey(name: "total_ward_roof_count") required int? totalRoof,
}) = _HouseConditionModel;

  factory HouseConditionModel.fromJson(Map<String, dynamic> json) => _$HouseConditionModelFromJson(json);

}