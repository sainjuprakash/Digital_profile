import 'package:freezed_annotation/freezed_annotation.dart';

part 'grant_stage_model.freezed.dart';
part 'grant_stage_model.g.dart';

@freezed
class GrantStageModel with _$GrantStageModel {
  GrantStageModel._();
  factory GrantStageModel({
    @JsonKey(name: "survey_ward_no") required int wardNumber,
    @JsonKey(name: "ward_f_eq_grant_first_stage_count")
    required int? firstStage,
    @JsonKey(name: "ward_f_eq_grant_second_stage_count")
    required int? secondStage,
    @JsonKey(name: "ward_f_eq_grant_third_stage_count")
    required int? thirdStage,
    @JsonKey(name: "ward_f_notavailable_count") required int? notAvailable,
    @JsonKey(name: "ward_total_eq_grant_stage_count") required int? total,
  }) = _GrantStageModel;

  factory GrantStageModel.fromJson(Map<String, dynamic> json) =>
      _$GrantStageModelFromJson(json);
}
