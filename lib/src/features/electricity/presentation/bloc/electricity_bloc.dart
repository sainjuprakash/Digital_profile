import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../data/model/electricity_model.dart';
import '../../domain/repository/electricity_repository.dart';

part 'electricity_event.dart';
part 'electricity_state.dart';

class ElectricityBloc extends Bloc<ElectricityEvent, ElectricityState> {
  String baseUrl, endPoint;
  ElectricityRepository _electricityRepository;
  ElectricityBloc(this._electricityRepository, this.baseUrl, this.endPoint)
      : super(ElectricityLoadingState()) {
    on<GetElectricityEvent>((event, emit) async {
      try {
        List<ElectricityModel> fetchedElectricityModel =
            await _electricityRepository.getElectricityData(baseUrl, endPoint);
        emit(
            ElectricitySuccessState(electricityModel: fetchedElectricityModel));
      } catch (errMsg) {
        emit(ElectricityFailureState(errMsg: errMsg.toString()));
      }
    });
  }
}
