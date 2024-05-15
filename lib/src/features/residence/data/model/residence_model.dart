import 'package:freezed_annotation/freezed_annotation.dart';

part 'residence_model.freezed.dart';
part 'residence_model.g.dart';

@freezed
class ResidenceModel with _$ResidenceModel {
  const ResidenceModel._();

  factory ResidenceModel({
    @JsonKey(name: "survey_ward_no") required int wardNumber,
    @JsonKey(name: "ward_ls_default") required int? lsDefault,
    @JsonKey(name: "ward_ls_foreign") required int? lsForeign,
    @JsonKey(name: "ward_ls_countryside") required int? lsCountrySide,
    @JsonKey(name: "ward_ls_notavailable") required int? lsNotAvailable,
    @JsonKey(name: "total_ward_living_status")
    required int? lsTotalLivingStatus,
  }) = _ResidenceModel;

  factory ResidenceModel.fromJson(Map<String, dynamic> json) =>
      _$ResidenceModelFromJson(json);
}
