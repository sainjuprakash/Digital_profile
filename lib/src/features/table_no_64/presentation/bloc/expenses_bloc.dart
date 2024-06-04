import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../data/model/expenses_model.dart';
import '../../domain/repository/expenses_repository.dart';

part 'expenses_event.dart';
part 'expenses_state.dart';

class ExpensesBloc extends Bloc<ExpensesEvent, ExpensesState> {
  ExpensesRepository expensesRepository;
  String baseUrl, endPoint;
  ExpensesBloc(this.expensesRepository, this.baseUrl, this.endPoint)
      : super(ExpensesLoadingState()) {
    on<GetExpensesEvent>((event, emit) async {
      try {
        List<ExpensesModel> fetchedModel =
            await expensesRepository.getExpensesData(baseUrl, endPoint);
        emit(ExpensesSuccessState(fetchedModel));
      } catch (errMsg) {
        emit(ExpensesFailureState(errMsg.toString()));
      }
    });
  }
}
