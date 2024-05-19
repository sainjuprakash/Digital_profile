part of 'insurance_bloc.dart';

@immutable
abstract class InsuranceState extends Equatable {
  @override
  List<Object?> get props => [];
}

class InsuranceLoadingState extends InsuranceState {}

class InsuranceSuccessState extends InsuranceState {
  List<InsuranceModel> insuranceModel;
  InsuranceSuccessState({required this.insuranceModel});
  @override
  List<Object?> get props => [insuranceModel];
}

class InsuranceFailureState extends InsuranceState {
  String errMsg;
  InsuranceFailureState({required this.errMsg});
}
