import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:digital_profile/src/features/age_table2_2/data/database/age_database.dart';
import 'package:digital_profile/src/features/age_table2_2/data/table_helper/age_table_helper.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../../../core/services/shared_preferences_service.dart';
import '../../data/model/population_acc_age.dart';
import '../../domain/repository/population_acc_age_repository.dart';

part 'age_population_event.dart';
part 'age_population_state.dart';

class AgePopulationBloc extends Bloc<AgePopulationEvent, AgePopulationState> {
  String baseurl, endPoint;
  final AgeRepository _ageRepository;
  AgePopulationBloc(this._ageRepository, this.baseurl, this.endPoint)
      : super(AgePopulationLoadingState()) {
    on<GetAgePopulationEvent>((event, emit) async {
      try {
        final prefs = await PrefsService.getInstance();
        final gauPalika = prefs.getString(PrefsServiceKeys.villageName);
        final connectivityResult = await Connectivity().checkConnectivity();
        if (connectivityResult == ConnectivityResult.wifi ||
            connectivityResult == ConnectivityResult.mobile) {
          await clearAgePopulationDatabase();
          List<AgePopulationModel> fetchedAgePopulationModel =
              await _ageRepository.getAgeData(baseurl, endPoint);
          for (var e in fetchedAgePopulationModel) {
            var tableData = AgeTableData(
                villageName: gauPalika!,
                surveyWardNumber: e.wardNumber,
                maleLessThanSix: e.maleLessThanSix,
                maleSixToFifteen: e.maleSixToFifteen,
                maleSixteenToFortyNine: e.maleSixteenToFortyNine,
                maleFiftyToSixtyNine: e.maleFiftyToSixtyNine,
                maleSeventyToNinety: e.maleSeventyToNinety,
                maleAboveNinety: e.maleAboveNinety,
                femaleLessThanSix: e.femaleLessThanSix,
                femaleSixToFifteen: e.femaleSixToFifteen,
                femaleSixteenToFortyNine: e.femaleSixteenToFortyNine,
                femaleFiftyToSixtyNine: e.femaleFiftyToSixtyNine,
                femaleSeventyToNinety: e.femaleSeventyToNinety,
                femaleNinetyAbove: e.femaleNinetyAbove,
                othersLessThanSix: e.othersLessThanSix,
                othersSixToFifteen: e.othersSixToFifteen,
                othersSixteenFortyNine: e.othersSixteenFortyNine,
                othersFiftyToSixtyNine: e.othersFiftyToSixtyNine,
                othersSeventyToNinety: e.othersSeventyToNinety,
                othersAboveNinety: e.othersAboveNinety,
                totalWardCount: e.totalWardCount);
            await addAgePopulation(tableData);
          }
          emit(AgePopulationSuccessState(
              agePopulationModel: fetchedAgePopulationModel));
        } else {
          final cachedData = await getAllAgePopulationData();
          final villageNames =
              cachedData.map((data) => data.villageName).toSet();
          if (cachedData.isNotEmpty && villageNames.contains(gauPalika)) {
            final cachedModel = cachedData.map((e) {
              return AgePopulationModel(
                  wardNumber: e.surveyWardNumber,
                  maleLessThanSix: e.maleLessThanSix,
                  maleSixToFifteen: e.maleSixToFifteen,
                  maleSixteenToFortyNine: e.maleSixteenToFortyNine,
                  maleFiftyToSixtyNine: e.maleFiftyToSixtyNine,
                  maleSeventyToNinety: e.maleSeventyToNinety,
                  maleAboveNinety: e.maleAboveNinety,
                  femaleLessThanSix: e.femaleLessThanSix,
                  femaleSixToFifteen: e.femaleSixToFifteen,
                  femaleSixteenToFortyNine: e.femaleSixteenToFortyNine,
                  femaleFiftyToSixtyNine: e.femaleFiftyToSixtyNine,
                  femaleSeventyToNinety: e.femaleSeventyToNinety,
                  femaleNinetyAbove: e.femaleNinetyAbove,
                  othersLessThanSix: e.othersLessThanSix,
                  othersSixToFifteen: e.othersSixToFifteen,
                  othersSixteenFortyNine: e.othersSixteenFortyNine,
                  othersFiftyToSixtyNine: e.othersFiftyToSixtyNine,
                  othersSeventyToNinety: e.othersSeventyToNinety,
                  othersAboveNinety: e.othersAboveNinety,
                  totalWardCount: e.totalWardCount);
            }).toList();
            emit(AgePopulationSuccessState(agePopulationModel: cachedModel));
          } else {
            emit(AgePopulationFailureState(
                errMsg:
                    'No internet connection and no cached data available.'));
          }
        }
      } catch (errMsg) {
        emit(AgePopulationFailureState(errMsg: errMsg.toString()));
      }
    });
  }
}
