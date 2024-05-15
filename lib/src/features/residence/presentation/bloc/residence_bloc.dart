import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../data/model/residence_model.dart';
import '../../domain/repository/residence_repository.dart';

part 'residence_event.dart';
part 'residence_state.dart';

class ResidenceBloc extends Bloc<ResidenceEvent, ResidenceState> {
  ResidenceRepository _residenceRepository;
  ResidenceBloc(this._residenceRepository) : super(ResidenceLoadingState()) {
    on<GetResidenceEvent>((event, emit) async {
      try {
        List<ResidenceModel> fetchedResidenceModel =
            await _residenceRepository.getResidenceData();
        emit(ResidenceSuccessState(
            fetchedResidenceModel: fetchedResidenceModel));
      } catch (errMsg) {
        emit(ResidenceFailureState(errMsg: errMsg.toString()));
      }
    });
  }
}
