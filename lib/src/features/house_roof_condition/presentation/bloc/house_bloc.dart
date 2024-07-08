import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:digital_profile/src/features/house_roof_condition/data/database/roof_condition_database.dart';
import 'package:digital_profile/src/features/house_roof_condition/data/table_helper/roof_condition_table_helper.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

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
        final cacheData = await getAllRoofData();
        if (cacheData.isNotEmpty) {
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
        }
        final connectivityResults = await Connectivity().checkConnectivity();
        if (connectivityResults == ConnectivityResult.wifi ||
            connectivityResults == ConnectivityResult.mobile) {
          List<HouseConditionModel> fetchedModel =
              await _houseConditionRepository.getHomeData(baseUrl, endPoint);
          for (var e in fetchedModel) {
            var roofData = RoofConditionTableData(
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
          if (cacheData.isNotEmpty) {
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
