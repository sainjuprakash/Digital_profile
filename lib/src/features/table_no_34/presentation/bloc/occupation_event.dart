part of 'occupation_bloc.dart';

@immutable
abstract class OccupationEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetOccupationEvent extends OccupationEvent{}
