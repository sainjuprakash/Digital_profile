import 'package:freezed_annotation/freezed_annotation.dart';

part 'bank_model.freezed.dart';
part 'bank_model.g.dart';

@freezed
class BankModel with _$BankModel {
  BankModel._();

  factory BankModel({
    @JsonKey(name: "survey_ward_no") required int wardNumber,
    @JsonKey(name: "ward_f_bank_acc_count") required int? bankAccount,
    @JsonKey(name: "ward_f_no_bank_acc_count") required int? noBankAccount,
    @JsonKey(name: "ward_houses_count") required int? wardHouses,
    @JsonKey(name: "total_ward_banc_acc_count") required int? totalBankAccount,
  }) = _BankModel;

  factory BankModel.fromJson(Map<String, dynamic> json) => _$BankModelFromJson(json);
}
