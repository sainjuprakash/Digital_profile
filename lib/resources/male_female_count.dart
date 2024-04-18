import 'package:freezed_annotation/freezed_annotation.dart';

part 'male_female_count.freezed.dart';
part 'male_female_count.g.dart';

@freezed
class PopulationCount with _$PopulationCount {
  const PopulationCount._();

  factory PopulationCount({
    @JsonKey(name: "survey_ward_no")  required String wardNum,
    @JsonKey(name: "male_count") String? maleCount,
    @JsonKey(name: "female_count") String? femaleCount,
    @JsonKey(name: "other_count") String? otherCount,
    @JsonKey(name: "total_ward_population") required String totalWardPopulation,
    @JsonKey(name: "male_hh_count") required int maleHhCount,
    @JsonKey(name: "female_hh_count") required int femaleHhCount,
    @JsonKey(name: "total_ward_hh_population")
    required int totalWardHhPopulation,
  }) = _PopulationCount;

  factory PopulationCount.fromJson(Map<String, dynamic> json) =>
      _$PopulationCountFromJson(json);
}
