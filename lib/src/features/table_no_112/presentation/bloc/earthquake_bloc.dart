import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:digital_profile/src/features/table_no_112/data/database/earthquake_damage_database.dart';
import 'package:digital_profile/src/features/table_no_112/data/table_helper/earthquake_damage_table_helper.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../data/model/earthquake_model.dart';
import '../../domain/repository/earthquake_repository.dart';

part 'earthquake_event.dart';
part 'earthquake_state.dart';

class EarthquakeBloc extends Bloc<EarthquakeEvent, EarthquakeState> {
  EarthquakeRepository earthquakeRepository;
  String baseUrl, endPoint;
  EarthquakeBloc(this.earthquakeRepository, this.baseUrl, this.endPoint)
      : super(EarthquakeLoadingState()) {
    on<GetEarthquakeEvent>((event, emit) async {
      try {
        final cacheData = await getAllEarthquakeDamageData();
        final connectivityResults = await Connectivity().checkConnectivity();
        if (connectivityResults == ConnectivityResult.wifi ||
            connectivityResults == ConnectivityResult.mobile) {
          await clearEarthquakeDamageData();
          List<EarthquakeModel> fetchedModel =
              await earthquakeRepository.getEarthquakeData(baseUrl, endPoint);
          for (var e in fetchedModel) {
            final earthquakeData = EarthquakeDamageTableData(
                wardNumber: e.wardNumber,
                isDamaged: e.isDamaged,
                isNotDamages: e.isNotDamages,
                notAvailable: e.notAvailable,
                total: e.total);
            await addEarthquakeDamageData(earthquakeData);
          }
          emit(EarthquakeSuccessState(fetchedModel));
        } else {
          if (cacheData.isNotEmpty) {
            final cacheModel = cacheData.map((e) {
              return EarthquakeModel(
                  wardNumber: e.wardNumber,
                  isDamaged: e.isDamaged,
                  isNotDamages: e.isNotDamages,
                  notAvailable: e.notAvailable,
                  total: e.total);
            }).toList();
            emit(EarthquakeSuccessState(cacheModel));
            return;
          } else {
            emit(EarthquakeFailureState(
                'No internet connection and no cached data available'));
          }
        }
      } catch (errMsg) {
        emit(EarthquakeFailureState(errMsg.toString()));
      }
    });
  }
}
