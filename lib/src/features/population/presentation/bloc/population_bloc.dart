import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../data/models/population_model.dart';
import '../../domain/repository/population_repository.dart';

part 'population_event.dart';
part 'population_state.dart';

class PopulationBloc extends Bloc<PopulationEvent, PopulationState> {
  final PopulationRepository _populationRepository;
  String baseurl, endPoint;
  PopulationBloc(this._populationRepository, this.baseurl, this.endPoint)
      : super(PopulationLoadingState()) {
    on<LoadPopulationEvent>((event, emit) async {
      try {
        List<PopulationModel> populationData =
            await _populationRepository.getPopData(baseurl, endPoint);

        emit(PopulationSuccessState(populationModel: populationData));
        // print("Success State");
      } catch (e) {
        emit(PopulationFailureState(errmsg: e.toString()));
        print(e.toString());
      }
    });
  }
}
