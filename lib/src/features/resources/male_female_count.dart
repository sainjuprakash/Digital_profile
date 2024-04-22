import 'package:freezed_annotation/freezed_annotation.dart';

part 'male_female_count.freezed.dart';
part 'male_female_count.g.dart';

@freezed
class PopulationCount with _$PopulationCount {
  const PopulationCount._();

  factory PopulationCount({
    @JsonKey(name: "survey_ward_no")   int? wardNum,
    @JsonKey(name: "male_count") double? maleCount,
    @JsonKey(name: "female_count") double? femaleCount,
    @JsonKey(name: "other_count") int? otherCount,
    @JsonKey(name: "total_ward_population")int? totalWardPopulation,
    @JsonKey(name: "male_hh_count")  int? maleHhCount,
    @JsonKey(name: "female_hh_count")  int? femaleHhCount,
    @JsonKey(name: "total_ward_hh_population")
    required int totalWardHhPopulation,
  }) = _PopulationCount;

  factory PopulationCount.fromJson(Map<String, dynamic> json) =>
      _$PopulationCountFromJson(json);
}
