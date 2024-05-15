import 'package:freezed_annotation/freezed_annotation.dart';

part 'ethnicity_population_model.freezed.dart';
part 'ethnicity_population_model.g.dart';

@freezed
class EthnicityPopulationModel with _$EthnicityPopulationModel {
  EthnicityPopulationModel._();

  factory EthnicityPopulationModel({
   // @JsonKey(name: "title") required String title,
    @JsonKey(name: "survey_ward_no") required int wardNumber,
    @JsonKey(name: "hill_brahman_count") required int? hillBrahman,
    @JsonKey(name: "terai_brahman_count") required int? teraiBrahman,
    @JsonKey(name: "hill_janjati_count") required int? hillJanajati,
    @JsonKey(name: "terai_janjati_count") required int? teraiJanajati,
    @JsonKey(name: "hill_dalit_count") required int? hillDalit,
    @JsonKey(name: "muslim_count") required int? muslim,
    @JsonKey(name: "other_count") required int? others,
    @JsonKey(name: "notavailable_count") required int? notAvailable,
    @JsonKey(name: "total_ward_ethnicity") required int? totalWardEthnicity,
  }) = _EthnicityPopulationModel;

  factory EthnicityPopulationModel.fromJson(Map<String, dynamic> json) =>
      _$EthnicityPopulationModelFromJson(json);
}
