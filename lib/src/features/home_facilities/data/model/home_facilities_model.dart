import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_facilities_model.freezed.dart';
part 'home_facilities_model.g.dart';

@freezed
class HomeFacilitiesModel with _$HomeFacilitiesModel {
  HomeFacilitiesModel._();

  factory HomeFacilitiesModel({
    @JsonKey(name: "survey_ward_no") required int wardNumber,
    @JsonKey(name: "ward_f_radio_count") required int? radio,
    @JsonKey(name: "ward_f_telivision_count") required int? television,
    @JsonKey(name: "ward_f_telephone_count") required int? telephone,
    @JsonKey(name: "ward_f_computer_count") required int? computer,
    @JsonKey(name: "ward_f_internet_count") required int? internet,
    @JsonKey(name: "ward_f_motorcycle_count") required int? motorcycle,
    @JsonKey(name: "ward_f_car_count") required int? car,
    @JsonKey(name: "ward_f_refrigerator_count") required int? refrigerator,
    @JsonKey(name: "ward_f_bus_count") required int? bus,
    @JsonKey(name: "ward_f_none_count") required int? none,
    @JsonKey(name: "ward_total_house_count") required int? houseCount,
    @JsonKey(name: "total_ward_aminity") required int? totalWardAminity,
  }) = _HomeFacilitiesModel;
  factory HomeFacilitiesModel.fromJson(Map<String, dynamic> json) =>
      _$HomeFacilitiesModelFromJson(json);
}
