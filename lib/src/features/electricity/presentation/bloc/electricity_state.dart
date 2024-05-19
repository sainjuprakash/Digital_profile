part of 'electricity_bloc.dart';

@immutable
abstract class ElectricityState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ElectricityLoadingState extends ElectricityState {}

class ElectricitySuccessState extends ElectricityState {
  List<ElectricityModel> electricityModel;
  ElectricitySuccessState({required this.electricityModel});
  @override
  List<Object?> get props => [electricityModel];
}

class ElectricityFailureState extends ElectricityState {
  String errMsg;
  ElectricityFailureState({required this.errMsg});
}
