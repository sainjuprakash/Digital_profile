part of 'expenses_bloc.dart';

@immutable
abstract class ExpensesEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetExpensesEvent extends ExpensesEvent {}
