import 'package:freezed_annotation/freezed_annotation.dart';

part 'loan_model.freezed.dart';
part 'loan_model.g.dart';

@freezed
class LoanModel with _$LoanModel {
  LoanModel._();

  factory LoanModel({
    @JsonKey(name: "survey_ward_no") required int wardNumber,
    @JsonKey(name: "ward_f_agri_loan_count") required int? agricultureLoan,
    @JsonKey(name: "ward_f_house_exp_loan_count") required int? houseExpLoan,
    @JsonKey(name: "ward_f_business_loan_count") required int? businessLoan,
    @JsonKey(name: "ward_f_foreignemp_loan_count") required int? foreignEmpLoan,
    @JsonKey(name: "ward_f_edu_loan_count") required int? educationLoan,
    @JsonKey(name: "ward_f_medi_loan_count") required int? medicalLoan,
    @JsonKey(name: "ward_f_other_loan_count") required int? othersLoan,
    @JsonKey(name: "ward_f_notavailable_count") required int? notAvailable,
    @JsonKey(name: "ward_houses_count") required int? wardHouses,
    @JsonKey(name: "ward_total_loan_count") required int? totalLoan,
  }) = _LoanModel;

  factory LoanModel.fromJson(Map<String, dynamic> json) =>
      _$LoanModelFromJson(json);
}
