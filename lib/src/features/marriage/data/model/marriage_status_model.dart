import 'package:freezed_annotation/freezed_annotation.dart';

part 'marriage_status_model.freezed.dart';
part 'marriage_status_model.g.dart';

@freezed
class MarriageStatusModel with _$MarriageStatusModel {
  const MarriageStatusModel._();

  factory MarriageStatusModel({
    @JsonKey(name: "survey_ward_no") required int wardNumber,
    @JsonKey(name:  "")
  }) = _MarriageStatusModel;

  factory MarriageStatusModel.fromJson(Map<String, dynamic> json) =>
      _$MarriageStatusModelFromJson(json);
}
