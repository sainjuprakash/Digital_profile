import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../data/model/animals_model.dart';
import '../../domain/repository/animals_repository.dart';

part 'animals_event.dart';
part 'animals_state.dart';

class AnimalsBloc extends Bloc<AnimalsEvent, AnimalsState> {
  String baseUrl, endPoint;
  AnimalRepository _animalsRepository;

  AnimalsBloc(this._animalsRepository, this.baseUrl, this.endPoint)
      : super(AnimalsLoadingState()) {
    on<GetAnimalsEvent>((event, emit) async {
      try {
        List<AnimalsModel> fetchedAnimalsData =
            await _animalsRepository.getAnimalsData(baseUrl, endPoint);
        emit(AnimalsSuccessState(fetchedAnimalsData));
      } catch (errMsg) {
        emit(AnimalsFailureState(errMsg.toString()));
      }
    });
  }
}
