import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:digital_profile/src/features/population/data/table_helper/population_table_helper.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import '../../../../../core/services/shared_preferences_service.dart';
import '../../data/models/population_model.dart';
import '../../data/population_database/population_database.dart';
import '../../domain/repository/population_repository.dart';

part 'population_event.dart';
part 'population_state.dart';

class PopulationBloc extends Bloc<PopulationEvent, PopulationState> {
  final PopulationRepository _populationRepository;
  final String baseUrl;
  final String endPoint;

  PopulationBloc(this._populationRepository, this.baseUrl, this.endPoint)
      : super(PopulationLoadingState()) {
    on<LoadPopulationEvent>((event, emit) async {
      try {
        // First, check for cached data in the local database
        // if (cachedData.isNotEmpty) {
        //   final cachedModel = cachedData.map((e) {
        //     return PopulationModel(
        //       surveyWardNumber: e.surveyWardNumber,
        //       maleCount: e.maleCount,
        //       femaleCount: e.femaleCount,
        //       othersCount: e.othersCount,
        //       totalWardPop: e.totalWardPop,
        //       maleHhCount: e.maleHhCount,
        //       femaleHhCount: e.femaleHhCount,
        //       totalWardHhCount: e.totalWardHhCount,
        //     );
        //   }).toList();
        //   emit(PopulationSuccessState(populationModel: cachedModel));
        //   return;
        // }
        final prefs = await PrefsService.getInstance();
        final gauPalika = prefs.getString(PrefsServiceKeys.villageName);
        //print(gauPalika);
        // Check for internet connectivity
        final connectivityResult = await Connectivity().checkConnectivity();
        if (connectivityResult == ConnectivityResult.wifi ||
            connectivityResult == ConnectivityResult.mobile) {
          await clearPopulationDatabase();
          // Fetch data from the API
          List<PopulationModel> fetchedModel =
              await _populationRepository.getPopData(baseUrl, endPoint);
          for (var model in fetchedModel) {
            var tableData = PopulationTableData(
              villageName: gauPalika!,
              femaleCount: model.femaleCount,
              maleCount: model.maleCount,
              femaleHhCount: model.femaleHhCount,
              maleHhCount: model.maleHhCount,
              othersCount: model.othersCount,
              surveyWardNumber: model.surveyWardNumber,
              totalWardHhCount: model.totalWardHhCount,
              totalWardPop: model.totalWardPop,
            );
            await addPopulation(tableData);
          }
          emit(PopulationSuccessState(populationModel: fetchedModel));
        } else {
          final cachedData = await getAllPopulationData();
          final villageNames =
              cachedData.map((data) => data.villageName).toSet();
          //print(villageNames);
          if (cachedData.isNotEmpty && villageNames.contains(gauPalika)) {
            final cachedModel = cachedData.map((e) {
              return PopulationModel(
                surveyWardNumber: e.surveyWardNumber,
                maleCount: e.maleCount,
                femaleCount: e.femaleCount,
                othersCount: e.othersCount,
                totalWardPop: e.totalWardPop,
                maleHhCount: e.maleHhCount,
                femaleHhCount: e.femaleHhCount,
                totalWardHhCount: e.totalWardHhCount,
              );
            }).toList();
            emit(PopulationSuccessState(populationModel: cachedModel));
          } else {
            emit(PopulationFailureState(
                errmsg:
                    'No internet connection and no cached data available.'));
          }
        }
      } catch (e) {
        print(e);
        emit(PopulationFailureState(errmsg: e.toString()));
      }
    });
  }
}
