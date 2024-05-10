part of 'age_population_bloc.dart';

@immutable
abstract class AgePopulationState extends Equatable {
  @override
  List<Object?> get props => [];
}

class AgePopulationLoadingState extends AgePopulationState {}

class AgePopulationSuccessState extends AgePopulationState {
  List<AgePopulationModel> agePopulationModel;
  AgePopulationSuccessState({required this.agePopulationModel});
}

class AgePopulationFailureState extends AgePopulationState {
  String errMsg;
  AgePopulationFailureState({required this.errMsg});
}
