import 'package:freezed_annotation/freezed_annotation.dart';

part 'animals_model.freezed.dart';
part 'animals_model.g.dart';

@freezed

class AnimalsModel with _$AnimalsModel{
  AnimalsModel._();

  factory AnimalsModel ({
    @JsonKey(name: "survey_ward_no") required int? wardNumber,
    @JsonKey(name: "ward_houses") required int? wardHouses,
    @JsonKey(name: "ward_panchi") required int? wardBirds,
    @JsonKey(name: "ward_livestock") required int? wardLivestock,

}) = _AnimalsModel;

  factory AnimalsModel.fromJson(Map<String ,dynamic> json) => _$AnimalsModelFromJson(json);



}