part of 'age_population_bloc.dart';

@immutable
abstract class AgePopulationEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class GetAgePopulationEvent extends AgePopulationEvent {}
