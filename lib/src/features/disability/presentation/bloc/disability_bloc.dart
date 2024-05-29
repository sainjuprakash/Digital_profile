import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../data/model/disability_model.dart';
import '../../domain/repository/disability_repository.dart';

part 'disability_event.dart';
part 'disability_state.dart';

class DisabilityBloc extends Bloc<DisabilityEvent, DisabilityState> {
  String baseUrl,endPoints;
  DisabilityRepository _disabilityRepository;
  DisabilityBloc(this._disabilityRepository,this.baseUrl,this.endPoints) : super(DisabilityLoadingState()) {
    on<DisabilityEvent>((event, emit) async {
      try {
        List<DisabilityModel> fetchedDisabilityData =
            await _disabilityRepository.getDisabilityData(baseUrl,endPoints);
        emit(DisabilitySuccessState(disabilityModel: fetchedDisabilityData));
      } catch (errMsg) {
        emit(DisabilityFailureState(errMsg: errMsg.toString()));
      }
    });
  }
}
