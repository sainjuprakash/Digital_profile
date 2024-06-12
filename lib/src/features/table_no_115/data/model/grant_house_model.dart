import 'package:freezed_annotation/freezed_annotation.dart';

part 'grant_house_model.freezed.dart';
part 'grant_house_model.g.dart';

@freezed
class GrantHouseModel with _$GrantHouseModel {
  GrantHouseModel._();
  factory GrantHouseModel({
    @JsonKey(name: "survey_ward_no") required int wardNumber,
    @JsonKey(name: "ward_f_eq_house_build_yes_count")required int? hasBuild,
    @JsonKey(name: "ward_f_eq_house_build_no_count")required int? hasNotBuild,
    @JsonKey(name: "ward_f_notavailable_count") required int? notAvailable,
    @JsonKey(name: "ward_total_eq_house_build_count") required int? total,
  }) = _GrantHouseModel;

  factory GrantHouseModel.fromJson(Map<String, dynamic> json) =>
      _$GrantHouseModelFromJson(json);
}
