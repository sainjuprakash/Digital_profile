import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:digital_profile/src/features/house_roof_condition/data/database/roof_condition_database.dart';
import 'package:digital_profile/src/features/house_roof_condition/data/table_helper/roof_condition_table_helper.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../../../core/services/shared_preferences_service.dart';
import '../../data/model/house_condition_model.dart';
import '../../domain/repository/house_condition_repository.dart';

part 'house_event.dart';
part 'house_state.dart';

class HouseBloc extends Bloc<HouseEvent, HouseState> {
  String baseUrl, endPoint;
  HouseRoofConditionRepository _houseConditionRepository;
  HouseBloc(this._houseConditionRepository, this.baseUrl, this.endPoint)
      : super(HouseLoadingState()) {
    on<GetHouseEvent>((event, emit) async {
      try {
        final prefs = await PrefsService.getInstance();
        final gauPalika = prefs.getString(PrefsServiceKeys.villageName);
        final connectivityResults = await Connectivity().checkConnectivity();
        if (connectivityResults == ConnectivityResult.wifi ||
            connectivityResults == ConnectivityResult.mobile) {
          await clearRoofConditionData();
          List<HouseConditionModel> fetchedModel =
              await _houseConditionRepository.getHomeData(baseUrl, endPoint);
          for (var e in fetchedModel) {
            var roofData = RoofConditionTableData(
                villageName: gauPalika!,
                wardNumber: e.wardNumber,
                khar: e.khar,
                jasta: e.jasta,
                stoneTile: e.stoneTile,
                rcc: e.rcc,
                wood: e.wood,
                mud: e.mud,
                others: e.others,
                notAvailable: e.notAvailable,
                totalRoof: e.totalRoof);
            await addRoofData(roofData);
          }
          emit(HouseSuccessState(fetchedModel));
        } else {
          final cacheData = await getAllRoofData();
          final villageName = cacheData.map((e) => e.villageName).toSet();
          if (cacheData.isNotEmpty && villageName.contains(gauPalika)) {
            final cacheModel = cacheData.map((e) {
              return HouseConditionModel(
                  wardNumber: e.wardNumber,
                  khar: e.khar,
                  jasta: e.jasta,
                  stoneTile: e.stoneTile,
                  rcc: e.rcc,
                  wood: e.wood,
                  mud: e.mud,
                  others: e.others,
                  notAvailable: e.notAvailable,
                  totalRoof: e.totalRoof);
            }).toList();
            emit(HouseSuccessState(cacheModel));
            return;
          } else {
            emit(HouseFailureState(
                'No internet connection and no cached data available.'));
          }
        }
      } catch (errMsg) {
        emit(HouseFailureState(errMsg.toString()));
      }
    });
  }
}
