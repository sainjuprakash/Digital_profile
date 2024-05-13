import 'package:freezed_annotation/freezed_annotation.dart';

part 'disability_model.freezed.dart';
part 'disability_model.g.dart';

@freezed
class DisabilityModel with _$DisabilityModel {
  const DisabilityModel._();

  factory DisabilityModel({
    @JsonKey(name: "survey_ward_no") required int wardNumber,
    @JsonKey(name: "ward_able_count") required int? able,
    @JsonKey(name: "ward_disable_count") required int? disable,
    @JsonKey(name: "ward_deaf_count") required int? deaf,
    @JsonKey(name: "ward_blind_count") required int? blind,
    @JsonKey(name: "ward_hearingloss_count") required int? hearingLoss,
    @JsonKey(name: "ward_ms_slammer_count") required int? slammer,
    @JsonKey(name: "ward_celeberal_count") required int? celeberal,
    @JsonKey(name: "ward_ms_redarded_count") required int? redarded,
    @JsonKey(name: "ward_multi_disable_count") required int? multiDisable,
    @JsonKey(name: "ward_mental_count") required int? mental,
    @JsonKey(name: "ward_not_available_count") required int? notAvailable,
    @JsonKey(name: "total_ward_disability_status")
    required int? totalDisabilityStatus,
  }) = _DisabilityModel;

  factory DisabilityModel.fromJson(Map<String, dynamic> json) =>
      _$DisabilityModelFromJson(json);
}
