import 'package:freezed_annotation/freezed_annotation.dart';

part 'population_acc_age.freezed.dart';
part 'population_acc_age.g.dart';

@freezed
class AgePopulationModel with _$AgePopulationModel {
  AgePopulationModel._();

  factory AgePopulationModel({
    @JsonKey(name: "survey_ward_no") required int wardNumber,
    @JsonKey(name: "ward_less_than_six_male_count")
    required int? maleLessThanSix,
    @JsonKey(name: "ward_six_to_fifteen_male_count")
    required int? maleSixToFifteen,
    @JsonKey(name: "ward_sixteen_to_fourtynine_male_count")
    required int? maleSixteenToFortyNine,
    @JsonKey(name: "ward_fifty_to_sixtynine_male_count")
    required int? maleFiftyToSixtyNine,
    @JsonKey(name: "ward_seventy_to_ninety_male_count")
    required int? maleSeventyToNinety,
    @JsonKey(name: "ward_ninety_above_male_count")
    required int? maleAboveNinety,
    @JsonKey(name: "ward_less_than_six_female_count")
    required int? femaleLessThanSix,
    @JsonKey(name: "ward_six_to_fifteen_female_count")
    required int? femaleSixToFifteen,
    @JsonKey(name: "ward_sixteen_to_fourtynine_female_count")
    required int? femaleSixteenToFortyNine,
    @JsonKey(name: "ward_fifty_to_sixtynine_female_count")
    required int? femaleFiftyToSixtyNine,
    @JsonKey(name: "ward_seventy_to_ninety_female_count")
    required int? femaleSeventyToNinety,
    @JsonKey(name: "ward_ninety_above_female_count")
    required int? femaleNinetyAbove,
    @JsonKey(name: "ward_less_than_six_other_count")
    required int? othersLessThanSix,
    @JsonKey(name: "ward_six_to_fifteen_other_count")
    required int? othersSixToFifteen,
    @JsonKey(name: "ward_sixteen_to_fourtynine_other_count")
    required int? othersSixteenFortyNine,
    @JsonKey(name: "ward_fifty_to_sixtynine_other_count")
    required int? othersFiftyToSixtyNine,
    @JsonKey(name: "ward_seventy_to_ninety_other_count")
    required int? othersSeventyToNinety,
    @JsonKey(name: "ward_ninety_above_other_count")
    required int? othersAboveNinety,
    @JsonKey(name: "total_ward_population_count") required int? totalWardCount,
  }) = _AgePopulationModel;

  factory AgePopulationModel.fromJson(Map<String, dynamic> json) =>
      _$AgePopulationModelFromJson(json);
}
