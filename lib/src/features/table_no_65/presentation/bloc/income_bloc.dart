import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../data/model/income_model.dart';
import '../../domain/repository/income_repository.dart';

part 'income_event.dart';
part 'income_state.dart';

class IncomeBloc extends Bloc<IncomeEvent, IncomeState> {
  IncomeRepository incomeRepository;
  String baseUrl, endPoint;
  IncomeBloc(this.incomeRepository, this.baseUrl, this.endPoint)
      : super(IncomeLoadingState()) {
    on<GetIncomeEvent>((event, emit) async {
      try {
        List<IncomeModel> fetchedModel =
            await incomeRepository.getIncomeData(baseUrl, endPoint);
        emit(IncomeSuccessState(fetchedModel));
      } catch (errMsg) {
        emit(IncomeFailureState(errMsg.toString()));
      }
    });
  }
}
