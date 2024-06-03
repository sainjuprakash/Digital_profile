part of 'bank_bloc.dart';

@immutable
abstract class BankState extends Equatable {
  @override
  List<Object?> get props => [];
}

class BankLoadingState extends BankState {}

class BankSuccessState extends BankState {
  List<BankModel> fetchedModel;
  BankSuccessState(this.fetchedModel);
  @override
  List<Object?> get props => [fetchedModel];
}

class BankFailureState extends BankState {
  String errMsg;
  BankFailureState(this.errMsg);
}
