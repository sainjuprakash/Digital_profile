import 'package:freezed_annotation/freezed_annotation.dart';

part 'allowance_model.freezed.dart';
part 'allowance_model.g.dart';

@freezed
class AllowanceModel with _$AllowanceModel {
  AllowanceModel._();

  factory AllowanceModel({
    @JsonKey(name: "survey_ward_no") required int wardNumber,
    @JsonKey(name: "ward_f_sc_process_wrong_count") required int? processWrong,
    @JsonKey(name: "ward_f_sc_briddha_bhatta_count")
    required int? briddhaBhatta,
    @JsonKey(name: "ward_f_sc_widow_count") required int? widow,
    @JsonKey(name: "ward_f_sc_singleman_count") required int? widower,
    @JsonKey(name: "ward_f_sc_disabled_count") required int? disabled,
    @JsonKey(name: "ward_f_sc_not_taken_count") required int? notTaken,
    @JsonKey(name: "ward_f_sc_not_processed_count") required int? notProcessed,
    @JsonKey(name: "ward_f_sc_indigenous_count") required int? indigenous,
    @JsonKey(name: "ward_f_sc_notavailable_count") required int? notAvailable,
    @JsonKey(name: "ward_total_social_security_count")
    required int? socialSecurity,
  }) = _AllowanceModel;

  factory AllowanceModel.fromJson(Map<String, dynamic> json) =>
      _$AllowanceModelFromJson(json);
}
