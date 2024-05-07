part of 'ethnicity_population_bloc.dart';

@immutable
abstract class EthnicityPopulationState extends Equatable {
  @override
  List<Object?> get props => [];
}

class EthnicityPopulationLoadingState extends EthnicityPopulationState {}

class EthnicityPopulationSuccessState extends EthnicityPopulationState {
  List<EthnicityPopulationModel> ethnicityPopulationModel;
  EthnicityPopulationSuccessState({required this.ethnicityPopulationModel});
}

class EthnicityPopulationFailureState extends EthnicityPopulationState {
  String errMsg;
  EthnicityPopulationFailureState({required this.errMsg});
}
