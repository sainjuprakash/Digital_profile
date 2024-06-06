import 'package:freezed_annotation/freezed_annotation.dart';

part 'road_distance_model.freezed.dart';
part 'road_distance_model.g.dart';

@freezed
class RoadDistanceModel with _$RoadDistanceModel {
  RoadDistanceModel._();

  factory RoadDistanceModel({
    @JsonKey(name: "survey_ward_no") required int wardNumber,
    @JsonKey(name: "ward_f_md_lessthanone_count")
    required int? lessThanOneHours,
    @JsonKey(name: "ward_f_md_twohour_count") required int? twoHours,
    @JsonKey(name: "ward_f_md_uptofive_count") required int? upToFiveHours,
    @JsonKey(name: "f_md_morefive") required int? moreThanFive,
    @JsonKey(name: "ward_total_market_distance_count") required int? total,
  }) = _RoadDistanceModel;

  factory RoadDistanceModel.fromJson(Map<String, dynamic> json) =>
      _$RoadDistanceModelFromJson(json);
}
