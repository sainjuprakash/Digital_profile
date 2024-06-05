import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../data/model/allowance_model.dart';
import '../../domain/repository/allowance_repository.dart';

part 'allowance_event.dart';
part 'allowance_state.dart';

class AllowanceBloc extends Bloc<AllowanceEvent, AllowanceState> {
  AllowanceRepository allowanceRepository;
  String baseUrl, endPoint;
  AllowanceBloc(this.allowanceRepository, this.baseUrl, this.endPoint)
      : super(AllowanceLoadingState()) {
    on<GetAllowanceEvent>((event, emit) async {
      try {
        List<AllowanceModel> fetchedModel =
            await allowanceRepository.getAllowanceData(baseUrl, endPoint);
        emit(AllowanceSuccessState(fetchedModel));
      } catch (errMsg) {
        emit(AllowanceFailureState(errMsg.toString()));
      }
    });
  }
}
