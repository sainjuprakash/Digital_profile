import 'package:digital_profile/src/features/pop_page/data/models/population_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

/**
 * Copyright (c) 2024
 * Created by Mahesh Yakami on 4/23/24.
 *
 * yakami.mahesh@gmail.com
 */

part 'population_response_model.freezed.dart';
part 'population_response_model.g.dart';

@freezed
class PopulationResponseModel with _$PopulationResponseModel {
  const PopulationResponseModel._();

  factory PopulationResponseModel({
    required String title,
    required List<PopulationModel> result,
  }) = _PopulationResponseModel;

  factory PopulationResponseModel.fromJson(Map<String, dynamic> json) =>
      _$PopulationResponseModelFromJson(json);
}
