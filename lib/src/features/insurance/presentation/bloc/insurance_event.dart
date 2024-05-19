part of 'insurance_bloc.dart';

@immutable
abstract class InsuranceEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetInsuranceEvent extends InsuranceEvent {}
