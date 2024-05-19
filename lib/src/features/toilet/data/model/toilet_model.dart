import 'package:freezed_annotation/freezed_annotation.dart';

part 'toilet_model.freezed.dart';
part 'toilet_model.g.dart';

@freezed
class ToiletModel with _$ToiletModel {
  ToiletModel._();

  factory ToiletModel(
      {@JsonKey(name: "survey_ward_no") required int? wardNumber,
      @JsonKey(name: "ward_f_no_toilet_count") required int? noToilet,
      @JsonKey(name: "ward_f_public_dhal_count") required int? publicDhal,
      @JsonKey(name: "ward_f_sefti_tank_count") required int? seftiTank,
      @JsonKey(name: "ward_f_ordinary_count") required int? ordinary,
      @JsonKey(name: "ward_f_not_available_count") required int? notAvailable,
      @JsonKey(name: "total_ward_toilet")
      required int? totalToilet}) = _ToiletModel;

  factory ToiletModel.fromJson(Map<String, dynamic> json) =>
      _$ToiletModelFromJson(json);
}
