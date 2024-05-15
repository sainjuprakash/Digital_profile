part of 'health_condition_bloc.dart';

@immutable
abstract class HealthConditionState extends Equatable {
  @override
  List<Object?> get props => [];
}

class HealthConditionLoadingState extends HealthConditionState {}

class HealthConditionSuccessState extends HealthConditionState {
  List<HealthConditionModel> healthConditionModel;
  HealthConditionSuccessState({required this.healthConditionModel});
  @override
  List<Object> get props => [healthConditionModel];
}

class HealthConditionFailureState extends HealthConditionState {
  String errMsg;
  HealthConditionFailureState({required this.errMsg});
}
