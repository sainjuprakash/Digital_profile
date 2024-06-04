part of 'income_bloc.dart';

@immutable
abstract class IncomeState extends Equatable {
  @override
  List<Object?> get props => [];
}

class IncomeLoadingState extends IncomeState {}

class IncomeSuccessState extends IncomeState {
  List<IncomeModel> fetchedModel;
  IncomeSuccessState(this.fetchedModel);
  @override
  List<Object?> get props => [fetchedModel];
}

class IncomeFailureState extends IncomeState {
  String errMsg;
  IncomeFailureState(this.errMsg);
}
