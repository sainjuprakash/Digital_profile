part of 'grant_stage_bloc.dart';

@immutable
abstract class GrantStageState extends Equatable {
  @override
  List<Object?> get props => [];
}

class GrantStageLoadingState extends GrantStageState {}

class GrantStageSuccessState extends GrantStageState {
  List<GrantStageModel> fetchedModel;
  GrantStageSuccessState(this.fetchedModel);
  @override
  List<Object?> get props => [fetchedModel];
}

class GrantStageFailureState extends GrantStageState {
  String errMsg;
  GrantStageFailureState(this.errMsg);
}
