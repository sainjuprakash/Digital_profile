part of 'population_bloc.dart';

@immutable
abstract class PopulationEvent extends Equatable {
 const PopulationEvent();
}

class LoadPopulationEvent extends PopulationEvent{
  @override
  List<Object?> get props => [];

}