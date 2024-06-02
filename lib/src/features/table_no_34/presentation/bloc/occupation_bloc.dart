import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../data/model/occupation_model.dart';
import '../../domain/repository/occupation_repository.dart';

part 'occupation_event.dart';
part 'occupation_state.dart';

class OccupationBloc extends Bloc<OccupationEvent, OccupationState> {
  OccupationRepository occupationRepository;
  String baseUrl, endPoint;
  OccupationBloc(this.occupationRepository, this.baseUrl, this.endPoint)
      : super(OccupationLoadingState()) {
    on<OccupationEvent>((event, emit) async {
      try {
        List<OccupationModel> fetchedModel =
            await occupationRepository.getOccupationData(baseUrl, endPoint);
        emit(OccupationSuccessState(fetchedModel));
      } catch (errMsg) {
        emit(OccupationFailureState(errMsg.toString()));
      }
    });
  }
}
