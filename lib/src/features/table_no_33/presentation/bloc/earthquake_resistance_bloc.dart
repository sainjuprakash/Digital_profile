import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../data/model/earthquake_resistance_model.dart';
import '../../domain/repository/eathquake_resistance_repository.dart';

part 'earthquake_resistance_event.dart';
part 'earthquake_resistance_state.dart';

class EarthquakeResistanceBloc
    extends Bloc<EarthquakeResistanceEvent, EarthquakeResistanceState> {
  String baseUrl, endPoint;
  EarthquakeResistanceRepository earthquakeResistanceRepository;
  EarthquakeResistanceBloc(
      this.earthquakeResistanceRepository, this.baseUrl, this.endPoint)
      : super(EarthquakeResistanceInitialState()) {
    on<GetEarthquakeResistanceEvent>((event, emit) async {
      try {
        List<EarthquakeResistanceModel> fetchedModel =
            await earthquakeResistanceRepository.getResistanceData(
                baseUrl, endPoint);
        emit(EarthquakeResistanceSuccessState(fetchedModel));
      } catch (errMsg) {
        emit(EarthquakeResistanceFailureState(errMsg.toString()));
      }
    });
  }
}
