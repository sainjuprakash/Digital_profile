part of 'bank_bloc.dart';

@immutable
abstract class BankEvent extends Equatable{
  @override
  List<Object?> get props => [];
}

class GetBankEvent extends BankEvent{

}
