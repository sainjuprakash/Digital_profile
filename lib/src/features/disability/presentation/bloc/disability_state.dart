part of 'disability_bloc.dart';

@immutable
abstract class DisabilityState extends Equatable {
  @override
  List<Object?> get props => [];
}

class DisabilityLoadingState extends DisabilityState {}

class DisabilitySuccessState extends DisabilityState {
  List<DisabilityModel> disabilityModel;
  DisabilitySuccessState({required this.disabilityModel});
}

class DisabilityFailureState extends DisabilityState {
  String errMsg;
  DisabilityFailureState({required this.errMsg});
}
