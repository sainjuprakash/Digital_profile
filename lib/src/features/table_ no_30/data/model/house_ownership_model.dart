import 'package:freezed_annotation/freezed_annotation.dart';

part 'house_ownership_model.freezed.dart';
part 'house_ownership_model.g.dart';

@freezed
class HouseOwnershipModel with _$HouseOwnershipModel{
  HouseOwnershipModel._();

  factory HouseOwnershipModel({
    @JsonKey(name: "survey_ward_no") required int wardNumber,
    @JsonKey(name: "ward_f_self_count") required int? personal,
    @JsonKey(name: "ward_f_rental_count") required int? rental,
    @JsonKey(name: "ward_f_org_count") required int? organizational,
    @JsonKey(name: "ward_f_sukumbasi_count") required int? sukumbasi,
    @JsonKey(name: "ward_f_other_count") required int? others,
    @JsonKey(name: "ward_f_not_available_count") required int? notAvailable,
    @JsonKey(name: "total_ward_house_owner") required int? total,

}) = _HouseOwnershipModel;

  factory HouseOwnershipModel.fromJson(Map<String,dynamic> json) => _$HouseOwnershipModelFromJson(json);
}