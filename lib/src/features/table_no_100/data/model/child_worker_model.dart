import 'package:freezed_annotation/freezed_annotation.dart';
part 'child_worker_model.freezed.dart';
part 'child_worker_model.g.dart';

@freezed
class ChildWorkerModel with _$ChildWorkerModel {
  ChildWorkerModel._();

  factory ChildWorkerModel({
    @JsonKey(name: "survey_ward_no") required int wardNumber,
    @JsonKey(name: "ward_f_under16_yes_count") required int? yes,
    @JsonKey(name: "ward_f_under16_no_count") required int? no,
    @JsonKey(name: "ward_f_under16_notavailable_count")
    required int? notAvailable,
    @JsonKey(name: "ward_houses") required int? wardHouses,
    @JsonKey(name: "ward_total_under16_count") required int? totalUnderSixteen,
  }) = _ChildWorkerModel;

  factory ChildWorkerModel.fromJson(Map<String, dynamic> json) =>
      _$ChildWorkerModelFromJson(json);
}
