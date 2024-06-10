part of 'loan_bloc.dart';

@immutable
abstract class LoanEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetLoanEvent extends LoanEvent {}
