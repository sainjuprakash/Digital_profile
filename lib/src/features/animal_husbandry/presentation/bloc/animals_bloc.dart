import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:digital_profile/src/features/animal_husbandry/data/database/animal_husbandry_database.dart';
import 'package:digital_profile/src/features/animal_husbandry/data/table_helper/animal_husbandry_table_helper.dart';
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
        final cacheData = await getAllAnimalData();
        if (cacheData.isNotEmpty) {
          final cacheModel = cacheData.map((e) {
            return AnimalsModel(
                wardNumber: e.wardNumber,
                wardHouses: e.wardHouses,
                wardBirds: e.wardBirds,
                wardLivestock: e.wardLivestock);
          }).toList();
          emit(AnimalsSuccessState(cacheModel));
          return;
        }
        final connectivityResults = await Connectivity().checkConnectivity();
        if (connectivityResults == ConnectivityResult.wifi ||
            connectivityResults == ConnectivityResult.mobile) {
          List<AnimalsModel> fetchedAnimalsData =
              await _animalsRepository.getAnimalsData(baseUrl, endPoint);
          for (var e in fetchedAnimalsData) {
            var animalsData = AnimalTableData(
                wardNumber: e.wardNumber,
                wardHouses: e.wardHouses,
                wardBirds: e.wardBirds,
                wardLivestock: e.wardLivestock);
            await addAnimalData(animalsData);
          }
          emit(AnimalsSuccessState(fetchedAnimalsData));
        } else {
          if (cacheData.isNotEmpty) {
            final cacheModel = cacheData.map((e) {
              return AnimalsModel(
                  wardNumber: e.wardNumber,
                  wardHouses: e.wardHouses,
                  wardBirds: e.wardBirds,
                  wardLivestock: e.wardLivestock);
            }).toList();
            emit(AnimalsSuccessState(cacheModel));
            return;
          } else {
            emit(AnimalsFailureState(
                'No internet connection and no cached data available.'));
          }
        }
      } catch (errMsg) {
        emit(AnimalsFailureState(errMsg.toString()));
      }
    });
  }
}
