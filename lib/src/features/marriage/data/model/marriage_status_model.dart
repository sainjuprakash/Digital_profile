import 'package:freezed_annotation/freezed_annotation.dart';

part 'marriage_status_model.freezed.dart';
part 'marriage_status_model.g.dart';

@freezed
class MarriageStatusModel with _$MarriageStatusModel {
  const MarriageStatusModel._();

  factory MarriageStatusModel({
    @JsonKey(name: "survey_ward_no") required int wardNumber,
    @JsonKey(name: "ward_ms_single_count") required int? single,
    @JsonKey(name: "ward_ms_single_woman_count") required int? singleWoman,
    @JsonKey(name: "ward_ms_single_man_count") required int? singleMana,
    @JsonKey(name: "ward_ms_married_count") required int? married,
    @JsonKey(name: "ward_ms_polygami_count") required int? polygami,
    @JsonKey(name: "ward_ms_divorced_count") required int? divorced,
    @JsonKey(name: "ward_ms_remarried_count") required int? remarried,
    @JsonKey(name: "ward_ms_seperated_count") required int? seperated,
    @JsonKey(name: "ward_ms_underage_count") required int? underage,
    @JsonKey(name: "ward_ms_not_available_count") required int? notAvailable,
    @JsonKey(name: "total_ward_marital_status")
    required int? totalMaritalStatus,
  }) = _MarriageStatusModel;

  factory MarriageStatusModel.fromJson(Map<String, dynamic> json) =>
      _$MarriageStatusModelFromJson(json);
}
