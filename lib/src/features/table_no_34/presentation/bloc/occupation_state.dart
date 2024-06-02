part of 'occupation_bloc.dart';

@immutable
abstract class OccupationState extends Equatable {
  @override
  List<Object?> get props => [];
}

class OccupationLoadingState extends OccupationState {}

class OccupationSuccessState extends OccupationState {
  List<OccupationModel> fetchedModel;
  OccupationSuccessState(this.fetchedModel);
  @override
  List<Object?> get props => [fetchedModel];
}

class OccupationFailureState extends OccupationState {
  String errMsg;
  OccupationFailureState(this.errMsg);
}
