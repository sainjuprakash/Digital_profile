part of 'allowance_bloc.dart';

@immutable
abstract class AllowanceState extends Equatable {
  @override
  List<Object?> get props => [];
}

class AllowanceLoadingState extends AllowanceState {}

class AllowanceSuccessState extends AllowanceState {
  List<AllowanceModel> fetchedModel;
  AllowanceSuccessState(this.fetchedModel);
  @override
  List<Object?> get props => [fetchedModel];
}

class AllowanceFailureState extends AllowanceState {
  String errMsg;
  AllowanceFailureState(this.errMsg);
}
