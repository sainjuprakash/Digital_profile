import 'package:freezed_annotation/freezed_annotation.dart';

part 'income_model.freezed.dart';
part 'income_model.g.dart';

@freezed
class IncomeModel with _$IncomeModel {
  IncomeModel._();

  factory IncomeModel({
    @JsonKey(name: "survey_ward_no") required int wardNumber,
    @JsonKey(name: "ward_f_annabali_income_count") required int? crops,
    @JsonKey(name: "ward_f_fruit_income_count") required int? fruits,
    @JsonKey(name: "ward_f_livestock_income_count") required int? livestock,
    @JsonKey(name: "ward_f_vegi_income_count") required int? vegi,
    @JsonKey(name: "ward_f_medi_income_count") required int? medi,
    @JsonKey(name: "ward_f_labour_income_count") required int? labour,
    @JsonKey(name: "ward_f_business_income_count") required int? business,
    @JsonKey(name: "ward_f_badesik_income_count") required int? foreignEmp,
    @JsonKey(name: "ward_f_office_income_count") required int? office,
    @JsonKey(name: "ward_f_other_income_count") required int? others,
    @JsonKey(name: "ward_total_income_count") required int? total,
  }) = _IncomeModel;

  factory IncomeModel.fromJson(Map<String, dynamic> json) =>
      _$IncomeModelFromJson(json);
}
