part of 'residence_bloc.dart';

@immutable
abstract class ResidenceState extends Equatable {
  @override
  List<Object> get props => [];
}

class ResidenceLoadingState extends ResidenceState {}

class ResidenceSuccessState extends ResidenceState {
  List<ResidenceModel> fetchedResidenceModel;
  ResidenceSuccessState({required this.fetchedResidenceModel});

  @override
  List<Object> get props => [fetchedResidenceModel];
}

class ResidenceFailureState extends ResidenceState {
  String errMsg;
  ResidenceFailureState({required this.errMsg});
}
