part of 'road_distance_bloc.dart';

@immutable
abstract class RoadDistanceState extends Equatable {
  @override
  List<Object?> get props => [];
}

class RoadDistanceLoadingState extends RoadDistanceState {}

class RoadDistanceSuccessState extends RoadDistanceState {
  List<RoadDistanceModel> fetchedModel;
  RoadDistanceSuccessState(this.fetchedModel);
  @override
  List<Object?> get props => [fetchedModel];
}

class RoadDistanceFailureState extends RoadDistanceState {
  String errMsg;
  RoadDistanceFailureState(this.errMsg);
}
