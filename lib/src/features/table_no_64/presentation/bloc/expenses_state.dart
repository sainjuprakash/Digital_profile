part of 'expenses_bloc.dart';

@immutable
abstract class ExpensesState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ExpensesLoadingState extends ExpensesState {}

class ExpensesSuccessState extends ExpensesState {
  List<ExpensesModel> fetchedModel;
  ExpensesSuccessState(this.fetchedModel);
  @override
  List<Object?> get props => [fetchedModel];
}

class ExpensesFailureState extends ExpensesState {
  String errMsg;
  ExpensesFailureState(this.errMsg);
}
