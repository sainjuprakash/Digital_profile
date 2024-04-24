part of 'population_bloc.dart';

@immutable
abstract class PopulationState extends Equatable {
  @override
  List<Object?> get props => [];
}

class PopulationLoadingState extends PopulationState {}

class PopulationFailureState extends PopulationState {
  final String errmsg;
  PopulationFailureState({required this.errmsg});
}

class PopulationSuccessState extends PopulationState {
  List<PopulationModel> populationModel;
  PopulationSuccessState({required this.populationModel});

  @override
  List<Object?> get props => [populationModel];
}
