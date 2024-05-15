import 'package:freezed_annotation/freezed_annotation.dart';

part 'health_condition_model.freezed.dart';
part 'health_condition_model.g.dart';

@freezed
class HealthConditionModel with _$HealthConditionModel {
  HealthConditionModel._();

  factory HealthConditionModel({
    @JsonKey(name: "survey_ward_no") required int wardNumber,
    @JsonKey(name: "ward_f_hc_healthy_count") required int? healthy,
    @JsonKey(name: "ward_f_hc_general_disease_count")
    required int? generalDisease,
    @JsonKey(name: "ward_f_hc_longterm_disease_count")
    required int? longTermDisease,
    @JsonKey(name: "ward_f_hc_covid_disease_count") required int? covid,
    @JsonKey(name: "ward_f_hc_not_available_count") required int? notAvailable,
    @JsonKey(name: "total_ward_health_condition")
    required int? totalWardHealthCondition,
  }) = _HealthConditionModel;

  factory HealthConditionModel.fromJson(Map<String, dynamic> json) =>
      _$HealthConditionModelFromJson(json);
}
