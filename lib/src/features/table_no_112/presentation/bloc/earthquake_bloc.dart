import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../data/model/earthquake_model.dart';
import '../../domain/repository/earthquake_repository.dart';

part 'earthquake_event.dart';
part 'earthquake_state.dart';

class EarthquakeBloc extends Bloc<EarthquakeEvent, EarthquakeState> {
  EarthquakeRepository earthquakeRepository;
  String baseUrl, endPoint;
  EarthquakeBloc(this.earthquakeRepository, this.baseUrl, this.endPoint)
      : super(EarthquakeLoadingState()) {
    on<GetEarthquakeEvent>((event, emit) async {
      try {
        List<EarthquakeModel> fetchedModel =
            await earthquakeRepository.getEarthquakeData(baseUrl, endPoint);
        emit(EarthquakeSuccessState(fetchedModel));
      } catch (errMsg) {
        emit(EarthquakeFailureState(errMsg.toString()));
      }
    });
  }
}
