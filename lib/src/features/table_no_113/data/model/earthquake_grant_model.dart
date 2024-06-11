import 'package:freezed_annotation/freezed_annotation.dart';

part 'earthquake_grant_model.freezed.dart';
part 'earthquake_grant_model.g.dart';

@freezed
class EarthquakeGrantModel with _$EarthquakeGrantModel {
  EarthquakeGrantModel._();

  factory EarthquakeGrantModel({
    @JsonKey(name: "survey_ward_no") required int wardNumber,
    @JsonKey(name: "ward_f_eq_damage_grant_yes_count") required int? gotGranted,
    @JsonKey(name: "ward_f_eq_damage_grant_no_count")
    required int? doesNotGotGranted,
    @JsonKey(name: "ward_f_notavailable_count") required int? notAvailable,
    @JsonKey(name: "ward_total_eq_damage_grant_count")
    required int? totalGranted,
  }) = _EarthquakeGrantModel;

  factory EarthquakeGrantModel.fromJson(Map<String, dynamic> json) =>
      _$EarthquakeGrantModelFromJson(json);
}
