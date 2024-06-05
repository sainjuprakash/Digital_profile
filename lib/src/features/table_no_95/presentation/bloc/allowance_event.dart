part of 'allowance_bloc.dart';

@immutable
abstract class AllowanceEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetAllowanceEvent extends AllowanceEvent {}
