import 'package:bloc/bloc.dart';
import 'package:digital_profile/src/features/population/data/table_helper/employee_table_helper.dart';
import 'package:drift/drift.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import '../../data/models/population_model.dart';
import '../../domain/repository/population_repository.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

part 'population_event.dart';
part 'population_state.dart';

class PopulationBloc extends Bloc<PopulationEvent, PopulationState> {
  final PopulationRepository _populationRepository;
  String baseurl, endPoint;

  PopulationBloc(this._populationRepository, this.baseurl, this.endPoint)
      : super(PopulationLoadingState()) {
    on<LoadPopulationEvent>((event, emit) async {
      try {
        // Check for connectivity
        final connectivityResult = await (Connectivity().checkConnectivity());
      //  addPopulation(entry);
        // if (connectivityResult == ConnectivityResult.wifi) {
        //   // Fetch data from API
        //   List<PopulationModel> populationData =
        //   await _populationRepository.getPopData(baseurl, endPoint);
        //
        //   // Convert to Drift model
        //   final populationList = populationData.map((pop) => PopulationsCompanion(
        //     title: Value(pop.title),
        //     surveyWardNumber: Value(pop.surveyWardNumber),
        //     maleCount: Value(pop.maleCount),
        //     femaleCount: Value(pop.femaleCount),
        //     othersCount: Value(pop.othersCount),
        //     totalWardPop: Value(pop.totalWardPop),
        //     maleHhCount: Value(pop.maleHhCount),
        //     femaleHhCount: Value(pop.femaleHhCount),
        //     totalWardHhCount: Value(pop.totalWardHhCount),
        //   )).toList();
        //
        //   // Save to database
        //   await _appDatabase.insertPopulations(populationList.cast<Population>());
        //
        //   emit(PopulationSuccessState(populationModel: populationData));
        // } else {
        //   // Load data from database if no Wi-Fi
        //   final dbData = await _appDatabase.getAllPopulations();
        //   final populationModel = dbData.map((pop) => PopulationModel(
        //     title: pop.title,
        //     surveyWardNumber: pop.surveyWardNumber,
        //     maleCount: pop.maleCount,
        //     femaleCount: pop.femaleCount,
        //     othersCount: pop.othersCount,
        //     totalWardPop: pop.totalWardPop,
        //     maleHhCount: pop.maleHhCount,
        //     femaleHhCount: pop.femaleHhCount,
        //     totalWardHhCount: pop.totalWardHhCount,
        //   )).toList();
        //
        //   emit(PopulationSuccessState(populationModel: populationModel));
        // }
      } catch (e) {
        emit(PopulationFailureState(errmsg: e.toString()));
      }
    });
  }
}
