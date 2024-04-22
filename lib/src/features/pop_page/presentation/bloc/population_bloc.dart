import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:digital_profile/src/features/pop_page/data/repository/population_repository_impl.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../data/models/population_model.dart';
import '../../domain/repository/population_repository.dart';

part 'population_event.dart';
part 'population_state.dart';

class PopulationBloc extends Bloc<PopulationEvent, PopulationState> {
  final PopulationRepository _populationRepository;
  PopulationBloc(this._populationRepository) : super(PopulationLoadingState()) {
    on<LoadPopulationEvent>((event, emit) async {
      try {
        //  print('-----------------');
        List<PopulationModel> populationData =
            await _populationRepository.getPopData();

        emit(PopulationSuccessState(populationModel: populationData));
        print("Success State");
      } catch (e) {
        emit(PopulationFailureState(errmsg: e.toString()));
        print('error has caught');
        print(e.toString());
      }
    });
  }
}
