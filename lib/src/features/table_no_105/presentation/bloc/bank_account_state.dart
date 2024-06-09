part of 'bank_account_bloc.dart';

@immutable
abstract class BankAccountState extends Equatable {
  @override
  List<Object?> get props => [];
}

class BankAccountLoadingState extends BankAccountState {}

class BankAccountSuccessState extends BankAccountState {
  List<BankAccountModel> fetchedModel;
  BankAccountSuccessState(this.fetchedModel);
  @override
  List<Object?> get props => [fetchedModel];
}

class BankAccountFailureState extends BankAccountState {
  String errrMsg;
  BankAccountFailureState(this.errrMsg);
}
