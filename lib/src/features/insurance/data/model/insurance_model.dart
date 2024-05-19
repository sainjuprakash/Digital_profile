import 'package:freezed_annotation/freezed_annotation.dart';

part 'insurance_model.freezed.dart';
part 'insurance_model.g.dart';

@freezed
class InsuranceModel with _$InsuranceModel {
  InsuranceModel._();

  factory InsuranceModel({
    @JsonKey(name: "survey_ward_no") required int wardNumber,
    @JsonKey(name: "ward_f_life_insu_count") required int? lifeInsurance,
    @JsonKey(name: "ward_f_health_insu_count") required int? healthInsurance,
    @JsonKey(name: "ward_f_livestock_insu_count")
    required int? liveStockInsurance,
    @JsonKey(name: "ward_f_other_insu_count") required int? othersInsurance,
    @JsonKey(name: "ward_f_not_available_count") required int? notAvailable,
    @JsonKey(name: "ward_total_house_count") required int? totalInsurance,
  }) = _InsuranceModel;

  factory InsuranceModel.fromJson(Map<String, dynamic> json) =>
      _$InsuranceModelFromJson(json);
}
