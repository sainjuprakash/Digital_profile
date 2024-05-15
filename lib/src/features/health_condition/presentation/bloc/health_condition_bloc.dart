import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../data/model/health_condition_model.dart';
import '../../domain/repository/health_condition_repository.dart';

part 'health_condition_event.dart';
part 'health_condition_state.dart';

class HealthConditionBloc
    extends Bloc<HealthConditionEvent, HealthConditionState> {
  HealthConditionRepository _healthConditionRepository;
  HealthConditionBloc(this._healthConditionRepository)
      : super(HealthConditionLoadingState()) {
    on<GetHealthConditionEvent>((event, emit) async {
      try {
        List<HealthConditionModel> fetchedHlthModel =
            await _healthConditionRepository.getHealthCondition();
        emit(HealthConditionSuccessState(
            healthConditionModel: fetchedHlthModel));
      } catch (errMsg) {
        emit(HealthConditionFailureState(errMsg: errMsg.toString()));
      }
    });
  }
}
