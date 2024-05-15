part of 'health_condition_bloc.dart';

@immutable
abstract class HealthConditionEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class GetHealthConditionEvent extends HealthConditionEvent {}
