import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:digital_profile/src/features/table_no_113/data/database/earthquake_grant_database.dart';
import 'package:digital_profile/src/features/table_no_113/data/table_helper/earthquake_grant_table_helper.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../data/model/earthquake_grant_model.dart';
import '../../domain/repository/earthquake_grant_repository.dart';

part 'earthquake_grant_event.dart';
part 'earthquake_grant_state.dart';

class EarthquakeGrantBloc
    extends Bloc<EarthquakeGrantEvent, EarthquakeGrantState> {
  EarthquakeGrantRepository earthquakeGrantRepository;
  String baseUrl, endPoint;
  EarthquakeGrantBloc(
      this.earthquakeGrantRepository, this.baseUrl, this.endPoint)
      : super(EarthquakeGrantLoadingState()) {
    on<GetEarthquakeGrantEvent>((event, emit) async {
      try {
        final cacheData = await getAllEarthquakeGrantData();
        if (cacheData.isNotEmpty) {
          final cacheModel = cacheData.map((e) {
            return EarthquakeGrantModel(
                wardNumber: e.wardNumber,
                gotGranted: e.gotGranted,
                doesNotGotGranted: e.doesNotGotGranted,
                notAvailable: e.notAvailable,
                totalGranted: e.totalGranted);
          }).toList();
          emit(EarthquakeGrantSuccessState(cacheModel));
          return;
        }
        final connectivityResults = await Connectivity().checkConnectivity();
        if (connectivityResults == ConnectivityResult.wifi ||
            connectivityResults == ConnectivityResult.mobile) {
          List<EarthquakeGrantModel> fetchedModel =
              await earthquakeGrantRepository.getEarthquakeGrantData(
                  baseUrl, endPoint);
          for (var e in fetchedModel) {
            var earthquakeData = EarthquakeGrantTableData(
                wardNumber: e.wardNumber,
                gotGranted: e.gotGranted,
                doesNotGotGranted: e.doesNotGotGranted,
                notAvailable: e.notAvailable,
                totalGranted: e.totalGranted);
            await addEarthquakeGrantData(earthquakeData);
          }
          emit(EarthquakeGrantSuccessState(fetchedModel));
        } else {
          if (cacheData.isNotEmpty) {
            final cacheModel = cacheData.map((e) {
              return EarthquakeGrantModel(
                  wardNumber: e.wardNumber,
                  gotGranted: e.gotGranted,
                  doesNotGotGranted: e.doesNotGotGranted,
                  notAvailable: e.notAvailable,
                  totalGranted: e.totalGranted);
            }).toList();
            emit(EarthquakeGrantSuccessState(cacheModel));
            return;
          } else {
            emit(EarthquakeGrantFailureState(
                'No internet connection and no cached data available'));
          }
        }
      } catch (errMsg) {
        emit(EarthquakeGrantFailureState(errMsg.toString()));
      }
    });
  }
}
