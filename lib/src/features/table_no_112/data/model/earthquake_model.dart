import 'package:freezed_annotation/freezed_annotation.dart';

part 'earthquake_model.freezed.dart';
part 'earthquake_model.g.dart';

@freezed
class EarthquakeModel with _$EarthquakeModel{
  EarthquakeModel._();

  factory EarthquakeModel({
    @JsonKey(name: "survey_ward_no") required int wardNumber,
    @JsonKey(name: "ward_f_eq_damage_yes_count") required int? isDamaged,
    @JsonKey(name: "ward_f_eq_damage_no_count") required int? isNotDamages,
    @JsonKey(name: "ward_f_notavailable_count") required int? notAvailable,
    @JsonKey(name: "ward_total_eq_damage_count") required int? total,
}) = _EarthquakeModel;

  factory EarthquakeModel.fromJson(Map<String ,dynamic> json) => _$EarthquakeModelFromJson(json);
}