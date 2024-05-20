import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../data/model/animals_model.dart';
import '../../domain/repository/animals_repository.dart';

part 'animals_event.dart';
part 'animals_state.dart';

class AnimalsBloc extends Bloc<AnimalsEvent, AnimalsState> {
  AnimalRepository _animalsRepository;

  AnimalsBloc(this._animalsRepository) : super(AnimalsLoadingState()) {
    on<GetAnimalsEvent>((event, emit) async {
      try {
        List<AnimalsModel> fetchedAnimalasData =
            await _animalsRepository.getAnimalsData();
        emit(AnimalsSuccessState(fetchedAnimalasData));
      } catch (errMsg) {
        emit(AnimalsFailureState(errMsg.toString()));
      }
    });
  }
}
