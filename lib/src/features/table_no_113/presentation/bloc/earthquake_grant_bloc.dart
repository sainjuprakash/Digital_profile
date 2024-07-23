import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:digital_profile/src/features/table_no_113/data/table_helper/earthquake_grant_table_helper.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../../../core/services/shared_preferences_service.dart';
import '../../data/database/earthquake_grant_database.dart';
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
        final prefs = await PrefsService.getInstance();
        final gauPalika = prefs.getString(PrefsServiceKeys.villageName);
        final connectivityResults = await Connectivity().checkConnectivity();
        if (connectivityResults == ConnectivityResult.wifi ||
            connectivityResults == ConnectivityResult.mobile) {
          await clearEarthquakeGrantData();
          List<EarthquakeGrantModel> fetchedModel =
              await earthquakeGrantRepository.getEarthquakeGrantData(
                  baseUrl, endPoint);
          for (var e in fetchedModel) {
            var earthquakeData = EarthquakeGrantTableData(
              villageName : gauPalika!,
                wardNumber: e.wardNumber,
                gotGranted: e.gotGranted,
                doesNotGotGranted: e.doesNotGotGranted,
                notAvailable: e.notAvailable,
                totalGranted: e.totalGranted);
            await addEarthquakeGrantData(earthquakeData);
          }
          emit(EarthquakeGrantSuccessState(fetchedModel));
        } else {
          final cacheData = await getAllEarthquakeGrantData();
          final villageName = cacheData.map((e) => e.villageName).toSet();
          if (cacheData.isNotEmpty && villageName.contains(gauPalika)) {
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
