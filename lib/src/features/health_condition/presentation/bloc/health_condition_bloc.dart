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
  String baseUrl, endPoints;
  HealthConditionRepository _healthConditionRepository;
  HealthConditionBloc(
      this._healthConditionRepository, this.baseUrl, this.endPoints)
      : super(HealthConditionLoadingState()) {
    on<GetHealthConditionEvent>((event, emit) async {
      try {
        List<HealthConditionModel> fetchedHlthModel =
            await _healthConditionRepository.getHealthCondition(
                baseUrl, endPoints);
        emit(HealthConditionSuccessState(
            healthConditionModel: fetchedHlthModel));
      } catch (errMsg) {
        emit(HealthConditionFailureState(errMsg: errMsg.toString()));
      }
    });
  }
}
