import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:digital_profile/core/services/shared_preferences_service.dart';
import 'package:digital_profile/src/features/residence/data/database/residence_database.dart';
import 'package:digital_profile/src/features/residence/data/table_helper/residence_table_helper.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../data/model/residence_model.dart';
import '../../domain/repository/residence_repository.dart';

part 'residence_event.dart';
part 'residence_state.dart';

class ResidenceBloc extends Bloc<ResidenceEvent, ResidenceState> {
  ResidenceRepository _residenceRepository;
  String baseUrl, endPoints;
  ResidenceBloc(this._residenceRepository, this.baseUrl, this.endPoints)
      : super(ResidenceLoadingState()) {
    on<GetResidenceEvent>((event, emit) async {
      try {
        final prefs = await PrefsService.getInstance();
        final gauPalika = prefs.getString(PrefsServiceKeys.villageName);
        final connectivityResults = await Connectivity().checkConnectivity();
        if (connectivityResults == ConnectivityResult.wifi ||
            connectivityResults == ConnectivityResult.mobile) {
          await clearResidenceData();
          List<ResidenceModel> fetchedResidenceModel =
              await _residenceRepository.getResidenceData(baseUrl, endPoints);
          for (var e in fetchedResidenceModel) {
            var residenceData = ResidenceTableData(
                villageName: gauPalika!,
                wardNumber: e.wardNumber,
                lsDefault: e.lsDefault,
                lsForeign: e.lsForeign,
                lsCountrySide: e.lsCountrySide,
                lsNotAvailable: e.lsNotAvailable,
                lsTotalLivingStatus: e.lsTotalLivingStatus);
            await addResidence(residenceData);
          }
          emit(ResidenceSuccessState(
              fetchedResidenceModel: fetchedResidenceModel));
        } else {
          final cacheData = await getAllResidenceData();
          final villageName = cacheData.map((e) => e.villageName);
          if (cacheData.isNotEmpty && villageName.contains(gauPalika)) {
            final cacheModel = cacheData.map((e) {
              return ResidenceModel(
                  wardNumber: e.wardNumber,
                  lsDefault: e.lsDefault,
                  lsForeign: e.lsForeign,
                  lsCountrySide: e.lsCountrySide,
                  lsNotAvailable: e.lsNotAvailable,
                  lsTotalLivingStatus: e.lsTotalLivingStatus);
            }).toList();
            emit(ResidenceSuccessState(fetchedResidenceModel: cacheModel));
            return;
          } else {
            ResidenceFailureState(
                errMsg: 'No internet connection and no cached data available.');
          }
        }
      } catch (errMsg) {
        emit(ResidenceFailureState(errMsg: errMsg.toString()));
      }
    });
  }
}
