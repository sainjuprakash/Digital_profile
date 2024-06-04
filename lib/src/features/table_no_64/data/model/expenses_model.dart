import 'package:freezed_annotation/freezed_annotation.dart';

part 'expenses_model.freezed.dart';
part 'expenses_model.g.dart';

@freezed
class ExpensesModel with _$ExpensesModel {
  ExpensesModel._();

  factory ExpensesModel({
    @JsonKey(name: "survey_ward_no") required int wardNumber,
    @JsonKey(name: "ward_f_clothes_count") required int? clothes,
    @JsonKey(name: "ward_f_edu_expense_count") required int? education,
    @JsonKey(name: "ward_f_health_expense_count") required int? health,
    @JsonKey(name: "ward_f_festiv_expense_count") required int? festival,
    @JsonKey(name: "ward_f_agri_expense_count") required int? agriculture,
    @JsonKey(name: "ward_f_other_expense_count") required int? others,
    @JsonKey(name: "total_expense_count") required int? totalExpenses,
  }) = _ExpensesModel;

  factory ExpensesModel.fromJson(Map<String, dynamic> json) =>
      _$ExpensesModelFromJson(json);
}
