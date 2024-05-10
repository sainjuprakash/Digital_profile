import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../data/model/population_acc_age.dart';
import '../../domain/repository/population_acc_age_repository.dart';

part 'age_population_event.dart';
part 'age_population_state.dart';

class AgePopulationBloc extends Bloc<AgePopulationEvent, AgePopulationState> {
  final AgeRepository _ageRepository;
  AgePopulationBloc(this._ageRepository) : super(AgePopulationLoadingState()) {
    on<GetAgePopulationEvent>((event, emit) async {
      try {
        List<AgePopulationModel> fetchedAgePopulationModel =
            await _ageRepository.getAgeData();
        emit(AgePopulationSuccessState(
            agePopulationModel: fetchedAgePopulationModel));
      } catch (errMsg) {
        emit(AgePopulationFailureState(errMsg: errMsg.toString()));
      }
    });
  }
}
