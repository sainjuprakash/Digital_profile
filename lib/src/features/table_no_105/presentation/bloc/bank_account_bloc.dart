import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../data/model/bank_account_model.dart';
import '../../domain/repository/bank_account_repository.dart';

part 'bank_account_event.dart';
part 'bank_account_state.dart';

class BankAccountBloc extends Bloc<BankAccountEvent, BankAccountState> {
  BankAccountRepository bankAccountRepository;
  String baseUrl, endPoint;
  BankAccountBloc(this.bankAccountRepository, this.baseUrl, this.endPoint)
      : super(BankAccountLoadingState()) {
    on<GetBankAccountEvent>((event, emit) async {
      try {
        List<BankAccountModel> fetchedModel =
            await bankAccountRepository.getBankDetails(baseUrl, endPoint);
        emit(BankAccountSuccessState(fetchedModel));
      } catch (errMsg) {
        emit(BankAccountFailureState(errMsg.toString()));
      }
    });
  }
}
