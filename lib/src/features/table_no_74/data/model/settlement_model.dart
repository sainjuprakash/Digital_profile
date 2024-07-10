import 'package:freezed_annotation/freezed_annotation.dart';
part 'settlement_model.freezed.dart';
part 'settlement_model.g.dart';
@freezed
class SettlementModel with _$SettlementModel{
  SettlementModel._();

  factory SettlementModel({
    @JsonKey(name: "survey_ward_no") required int wardNumber,
    @JsonKey(name : "ward_f_perma_migration_count") required int? permanent,
    @JsonKey(name : "ward_f_temp_migration_count") required int? temporary,
    @JsonKey(name : "ward_f_other_migration_count") required int? others,
    @JsonKey(name : "ward_total_migration_count") required int? total,

}) = _SettlementModel;

  factory SettlementModel.fromJson(Map<String,dynamic> json) => _$SettlementModelFromJson(json);
}