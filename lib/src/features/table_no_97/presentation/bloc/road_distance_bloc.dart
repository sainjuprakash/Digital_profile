import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../data/model/road_distance_model.dart';
import '../../domain/repository/road_distance_repository.dart';

part 'road_distance_event.dart';
part 'road_distance_state.dart';

class RoadDistanceBloc extends Bloc<RoadDistanceEvent, RoadDistanceState> {
  RoadDistanceRepository roadDistanceRepository;
  String baseUrl, endPoint;
  RoadDistanceBloc(this.roadDistanceRepository, this.baseUrl, this.endPoint)
      : super(RoadDistanceLoadingState()) {
    on<GetRoadDistanceEvent>((event, emit) async {
      try {
        List<RoadDistanceModel> fetchedModel =
            await roadDistanceRepository.getRoadData(baseUrl, endPoint);
        emit(RoadDistanceSuccessState(fetchedModel));
      } catch (errMsg) {
        emit(RoadDistanceFailureState(errMsg.toString()));
      }
    });
  }
}
