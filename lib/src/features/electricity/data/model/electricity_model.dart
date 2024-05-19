import 'package:freezed_annotation/freezed_annotation.dart';

part 'electricity_model.freezed.dart';
part 'electricity_model.g.dart';

@freezed
class ElectricityModel with _$ElectricityModel {
  ElectricityModel._();
  factory ElectricityModel({
    @JsonKey(name: "survey_ward_no") required int wardNumber,
    @JsonKey(name: "ward_f_ls_kerosene_count") required int? kerosene,
    @JsonKey(name: "ward_f_ls_biogas_count") required int? bioGas,
    @JsonKey(name: "ward_f_ls_solar_count") required int? solar,
    @JsonKey(name: "ward_f_ls_electricity_count")
    required int? electricityLaghu,
    @JsonKey(name: "ward_f_ls_electricity_m_count")
    required int? electricityNational,
    @JsonKey(name: "ward_f_ls_electricity_o_count") required int? others,
    @JsonKey(name: "ward_f_not_available_count") required int? notAvailable,
    @JsonKey(name: "ward_total_house_count") required int? totalHouseCount,
  }) = _ElectricityModel;

  factory ElectricityModel.fromJson(Map<String, dynamic> json) =>
      _$ElectricityModelFromJson(json);
}
