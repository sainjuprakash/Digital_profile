part of 'income_bloc.dart';

@immutable
abstract class IncomeEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetIncomeEvent extends IncomeEvent {}
