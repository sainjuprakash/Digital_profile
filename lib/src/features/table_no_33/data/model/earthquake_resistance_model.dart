import 'package:freezed_annotation/freezed_annotation.dart';

part 'earthquake_resistance_model.freezed.dart';
part 'earthquake_resistance_model.g.dart';

@freezed
class EarthquakeResistanceModel with _$EarthquakeResistanceModel {
  EarthquakeResistanceModel._();

  factory EarthquakeResistanceModel({
    @JsonKey(name: "survey_ward_no") required int wardNumber,
    @JsonKey(name: "ward_f_earthquake_resis_count")
    required int? earthquakeResistance,
    @JsonKey(name: "ward_f_no_earthquake_resis_count")
    required int? notEarthquakeResistance,
    @JsonKey(name: "total_ward_earthquake_resis_count") required int? total,
  }) = _EarthquakeResistanceModel;

  factory EarthquakeResistanceModel.fromJson(Map<String, dynamic> json) =>
      _$EarthquakeResistanceModelFromJson(json);
}
