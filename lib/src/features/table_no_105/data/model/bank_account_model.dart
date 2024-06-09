import 'package:freezed_annotation/freezed_annotation.dart';

part 'bank_account_model.freezed.dart';
part 'bank_account_model.g.dart';

@freezed
class BankAccountModel with _$BankAccountModel {
  BankAccountModel._();

  factory BankAccountModel({
    @JsonKey(name: "survey_ward_no") required int wardNumber,
    @JsonKey(name: "ward_f_dev_bank_count") required int? devBank,
    @JsonKey(name: "ward_f_comm_bank_count") required int? commercialBank,
    @JsonKey(name: "ward_f_sahakari_count") required int? sahakari,
    @JsonKey(name: "ward_f_village_loan_count") required int? bitiyaSanstha,
    @JsonKey(name: "ward_f_notavailable_count") required int? notAvailable,
    @JsonKey(name: "ward_f_houses_count") required int? total,
    @JsonKey(name: "ward_total_bank_count") required int? totalBankCount,
  }) = _BankAccountModel;

  factory BankAccountModel.fromJson(Map<String, dynamic> json) =>
      _$BankAccountModelFromJson(json);
}
