import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../data/model/loan_model.dart';
import '../../domain/repository/loan_repository.dart';

part 'loan_event.dart';
part 'loan_state.dart';

class LoanBloc extends Bloc<LoanEvent, LoanState> {
  LoanRepository loanRepository;
  String baseUrl, endPoint;
  LoanBloc(this.loanRepository, this.baseUrl, this.endPoint)
      : super(LoanLoadingState()) {
    on<GetLoanEvent>((event, emit) async {
      try {
        List<LoanModel> fetchedModel =
            await loanRepository.getLoanData(baseUrl, endPoint);
        emit(LoanSuccessState(fetchedModel));
      } catch (errMsg) {
        emit(LoanFailureState(errMsg.toString()));
      }
    });
  }
}
