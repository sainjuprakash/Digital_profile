part of 'loan_bloc.dart';

@immutable
abstract class LoanState extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoanLoadingState extends LoanState {}

class LoanSuccessState extends LoanState {
  List<LoanModel> fetchedModel;
  LoanSuccessState(this.fetchedModel);
  @override
  List<Object?> get props => [fetchedModel];
}

class LoanFailureState extends LoanState {
  String errMsg;
  LoanFailureState(this.errMsg);
}
