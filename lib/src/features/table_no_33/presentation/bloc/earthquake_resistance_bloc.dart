import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:digital_profile/src/features/table_no_33/data/database/earthquake_database.dart';
import 'package:digital_profile/src/features/table_no_33/data/table_helper/earthquake_table_helper.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../data/model/earthquake_resistance_model.dart';
import '../../domain/repository/eathquake_resistance_repository.dart';

part 'earthquake_resistance_event.dart';
part 'earthquake_resistance_state.dart';

class EarthquakeResistanceBloc
    extends Bloc<EarthquakeResistanceEvent, EarthquakeResistanceState> {
  String baseUrl, endPoint;
  EarthquakeResistanceRepository earthquakeResistanceRepository;
  EarthquakeResistanceBloc(
      this.earthquakeResistanceRepository, this.baseUrl, this.endPoint)
      : super(EarthquakeResistanceInitialState()) {
    on<GetEarthquakeResistanceEvent>((event, emit) async {
      try {
        final cacheData = await getALlEarthquakeResData();
        if (cacheData.isNotEmpty) {
          final cacheModel = cacheData.map((e) {
            return EarthquakeResistanceModel(
                wardNumber: e.wardNumber,
                earthquakeResistance: e.earthquakeResistance,
                notEarthquakeResistance: e.notEarthquakeResistance,
                total: e.total);
          }).toList();
          emit(EarthquakeResistanceSuccessState(cacheModel));
          return;
        }
        final connectivityResults = await Connectivity().checkConnectivity();
        if (connectivityResults == ConnectivityResult.wifi ||
            connectivityResults == ConnectivityResult.mobile) {
          List<EarthquakeResistanceModel> fetchedModel =
              await earthquakeResistanceRepository.getResistanceData(
                  baseUrl, endPoint);
          for (var e in fetchedModel) {
            var earthquakeData = EarthquakeTableData(
              wardNumber: e.wardNumber,
              earthquakeResistance: e.earthquakeResistance,
              notEarthquakeResistance: e.notEarthquakeResistance,
              total: e.total,
            );
            await addEarthquakeData(earthquakeData);
          }
          emit(EarthquakeResistanceSuccessState(fetchedModel));
        } else {
          if (cacheData.isNotEmpty) {
            final cacheModel = cacheData.map((e) {
              return EarthquakeResistanceModel(
                  wardNumber: e.wardNumber,
                  earthquakeResistance: e.earthquakeResistance,
                  notEarthquakeResistance: e.notEarthquakeResistance,
                  total: e.total);
            }).toList();
            emit(EarthquakeResistanceSuccessState(cacheModel));
            return;
          } else {
            emit(EarthquakeResistanceFailureState(
                'No internet connection and no cached data available'));
          }
        }
      } catch (errMsg) {
        emit(EarthquakeResistanceFailureState(errMsg.toString()));
      }
    });
  }
}
