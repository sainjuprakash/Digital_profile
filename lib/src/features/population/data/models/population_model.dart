import 'package:freezed_annotation/freezed_annotation.dart';

part 'population_model.freezed.dart';
part 'population_model.g.dart';

@freezed
class PopulationModel with _$PopulationModel {
  const PopulationModel._();

  factory PopulationModel({
    @JsonKey(name: "title") required String? title,
    @JsonKey(name: "survey_ward_no") required String surveyWardNumber,
    @JsonKey(name: "male_count") required int? maleCount,
    @JsonKey(name: "female_count") required int? femaleCount,
    @JsonKey(name: "other_count") required int? othersCount,
    @JsonKey(name: "total_ward_population") required int? totalWardpop,
    @JsonKey(name: "male_hh_count") required int? maleHhCount,
    @JsonKey(name: "female_hh_count") required int? femaleHhCount,
    @JsonKey(name: "total_ward_hh_population") required int? totalWardHhCount,
  }) = _PopulationModel;

  factory PopulationModel.fromJson(Map<String, dynamic> json) =>
      _$PopulationModelFromJson(json);
}
