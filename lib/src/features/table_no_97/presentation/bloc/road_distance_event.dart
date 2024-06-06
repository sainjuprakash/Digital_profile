part of 'road_distance_bloc.dart';

@immutable
abstract class RoadDistanceEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetRoadDistanceEvent extends RoadDistanceEvent {}
