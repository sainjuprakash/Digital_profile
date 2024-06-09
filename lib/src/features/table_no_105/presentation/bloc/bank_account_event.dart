part of 'bank_account_bloc.dart';

@immutable
abstract class BankAccountEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetBankAccountEvent extends BankAccountEvent {}
