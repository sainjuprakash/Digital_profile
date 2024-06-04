import 'package:freezed_annotation/freezed_annotation.dart';

part 'meat_model.freezed.dart';
part 'meat_model.g.dart';

@freezed
class MeatModel with _$MeatModel {
  MeatModel._();

  factory MeatModel({
    @JsonKey(name: "survey_ward_no") required int wardNumber,
    @JsonKey(name: "ward_f_meat_qty_sum") required int? animalsQuantity,
    @JsonKey(name: "ward_f_meat_kg_sum") required int? meatKg,
    @JsonKey(name: "ward_f_meat_earning_sum") required int? meatEarning,
    @JsonKey(name: "ghardhuri_count") required int? houseCount,
  }) = _MeatModel;

  factory MeatModel.fromJson(Map<String, dynamic> json) =>
      _$MeatModelFromJson(json);
}
