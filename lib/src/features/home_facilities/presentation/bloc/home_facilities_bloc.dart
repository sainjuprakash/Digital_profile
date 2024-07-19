import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:digital_profile/src/features/home_facilities/data/database/home_facilities_database.dart';
import 'package:digital_profile/src/features/home_facilities/data/table_helper/home_facilities_table_helper.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../data/model/home_facilities_model.dart';
import '../../domain/repository/home_facilities_repository.dart';

part 'home_facilities_event.dart';
part 'home_facilities_state.dart';

class HomeFacilitiesBloc
    extends Bloc<HomeFacilitiesEvent, HomeFacilitiesState> {
  String baseUrl, endPoint;
  HomeFacilitiesRepository _homeFacilitiesRepository;
  HomeFacilitiesBloc(
      this._homeFacilitiesRepository, this.baseUrl, this.endPoint)
      : super(HomeFacilitiesLoadingState()) {
    on<HomeFacilitiesEvent>((event, emit) async {
      try {
        final cacheData = await getAllHomeFacilities();
        final connectivityResults = await Connectivity().checkConnectivity();
        if (connectivityResults == ConnectivityResult.wifi ||
            connectivityResults == ConnectivityResult.mobile) {
          await clearHomeFacilitiesData();
          List<HomeFacilitiesModel> fetchedModel =
              await _homeFacilitiesRepository.getHomeFacilities(
                  baseUrl, endPoint);
          for (var e in fetchedModel) {
            var homeFacilities = HomeFacilitiesTableData(
                wardNumber: e.wardNumber,
                radio: e.radio,
                television: e.television,
                telephone: e.telephone,
                computer: e.computer,
                internet: e.internet,
                motorcycle: e.motorcycle,
                car: e.car,
                refrigerator: e.refrigerator,
                bus: e.bus,
                none: e.none,
                houseCount: e.houseCount,
                totalWardAminity: e.totalWardAminity);
            await addHomeFacilities(homeFacilities);
          }
          emit(HomeFacilitiesSuccessState(fetchedModel));
        } else {
          if (cacheData.isNotEmpty) {
            final cacheModel = cacheData.map((e) {
              return HomeFacilitiesModel(
                  wardNumber: e.wardNumber,
                  radio: e.radio,
                  television: e.television,
                  telephone: e.telephone,
                  computer: e.computer,
                  internet: e.internet,
                  motorcycle: e.motorcycle,
                  car: e.car,
                  refrigerator: e.refrigerator,
                  bus: e.bus,
                  none: e.none,
                  houseCount: e.houseCount,
                  totalWardAminity: e.totalWardAminity);
            }).toList();
            emit(HomeFacilitiesSuccessState(cacheModel));
            return;
          } else {
            emit(HomeFacilitiesFailureState(
                'No internet connection and no cached data available.'));
          }
        }
      } catch (errMsg) {
        emit(HomeFacilitiesFailureState(errMsg.toString()));
      }
    });
  }
}
