import 'package:freezed_annotation/freezed_annotation.dart';
part 'occupation_model.freezed.dart';
part 'occupation_model.g.dart';

@freezed
class OccupationModel with _$OccupationModel {
  OccupationModel._();

  factory OccupationModel({
    @JsonKey(name: "survey_ward_no") required int wardNumber,
    @JsonKey(name: "ward_f_occ_agri_count") required int? agriculture,
    @JsonKey(name: "ward_f_occ_office_count") required int? office,
    @JsonKey(name: "ward_f_occ_business_count") required int? business,
    @JsonKey(name: "ward_f_occ_worker_count") required int? worker,
    @JsonKey(name: "ward_f_occ_entrepreneur_count") required int? entrepreneur,
    @JsonKey(name: "ward_f_occ_foreign_emp_count") required int? foreignEmp,
    @JsonKey(name: "ward_f_occ_student_count") required int? student,
    @JsonKey(name: "ward_f_occ_housewife_count") required int? houseWife,
    @JsonKey(name: "ward_f_occ_unemployed_count") required int? unemployed,
    @JsonKey(name: "ward_f_occ_underage_count") required int? underage,
    @JsonKey(name: "ward_f_occ_pension_count") required int? pension,
    @JsonKey(name: "ward_f_occ_technical_count") required int? technical,
    @JsonKey(name: "ward_f_occ_senior_ctzn_count") required int? seniorCtzn,
    @JsonKey(name: "ward_f_occ_other_count") required int? others,
    @JsonKey(name: "ward_f_occ_notavailable_count") required int? notAvailable,
    @JsonKey(name: "total_ward_occupation_count") required int? total,
  }) = _OccupationModel;

  factory OccupationModel.fromJson(Map<String, dynamic> json) =>
      _$OccupationModelFromJson(json);
}
