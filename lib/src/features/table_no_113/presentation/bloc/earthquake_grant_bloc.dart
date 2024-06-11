import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../data/model/earthquake_grant_model.dart';
import '../../domain/repository/earthquake_grant_repository.dart';

part 'earthquake_grant_event.dart';
part 'earthquake_grant_state.dart';

class EarthquakeGrantBloc
    extends Bloc<EarthquakeGrantEvent, EarthquakeGrantState> {
  EarthquakeGrantRepository earthquakeGrantRepository;
  String baseUrl, endPoint;
  EarthquakeGrantBloc(
      this.earthquakeGrantRepository, this.baseUrl, this.endPoint)
      : super(EarthquakeGrantLoadingState()) {
    on<GetEarthquakeGrantEvent>((event, emit) async {
      try {
        List<EarthquakeGrantModel> fetchedModel =
            await earthquakeGrantRepository.getEarthquakeGrantData(
                baseUrl, endPoint);
        emit(EarthquakeGrantSuccessState(fetchedModel));
      } catch (errMsg) {
        emit(EarthquakeGrantFailureState(errMsg.toString()));
      }
    });
  }
}
