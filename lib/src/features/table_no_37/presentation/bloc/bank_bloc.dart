import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../data/model/bank_model.dart';
import '../../domain/repository/bank_repository.dart';

part 'bank_event.dart';
part 'bank_state.dart';

class BankBloc extends Bloc<BankEvent, BankState> {
  BankRepository bankRepository;
  String baseUrl, endPoint;
  BankBloc(this.bankRepository, this.baseUrl, this.endPoint)
      : super(BankLoadingState()) {
    on<GetBankEvent>((event, emit) async {
      try {
        List<BankModel> fetchedModel =
            await bankRepository.getBankData(baseUrl, endPoint);
        emit(BankSuccessState(fetchedModel));
      } catch (errMsg) {
        emit(BankFailureState(errMsg.toString()));
        print(errMsg.toString());
      }
    });
  }
}
