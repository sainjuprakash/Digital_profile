import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:digital_profile/src/features/disability/data/database/disability_database.dart';
import 'package:digital_profile/src/features/disability/data/table_helper/disability_table_helper.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../data/model/disability_model.dart';
import '../../domain/repository/disability_repository.dart';

part 'disability_event.dart';
part 'disability_state.dart';

class DisabilityBloc extends Bloc<DisabilityEvent, DisabilityState> {
  String baseUrl, endPoints;
  DisabilityRepository _disabilityRepository;
  DisabilityBloc(this._disabilityRepository, this.baseUrl, this.endPoints)
      : super(DisabilityLoadingState()) {
    on<DisabilityEvent>((event, emit) async {
      try {
        final cacheData = await getAllDisabilityData();
        final connectivityResults = await Connectivity().checkConnectivity();
        if (connectivityResults == ConnectivityResult.wifi ||
            connectivityResults == ConnectivityResult.mobile) {
          await clearDisabilityData();
          List<DisabilityModel> fetchedDisabilityData =
              await _disabilityRepository.getDisabilityData(baseUrl, endPoints);
          for (var e in fetchedDisabilityData) {
            final disabilityOfflineData = DisabilityTableData(
                wardNumber: e.wardNumber,
                able: e.able,
                disable: e.disable,
                deaf: e.deaf,
                blind: e.blind,
                hearingLoss: e.hearingLoss,
                slammer: e.slammer,
                celeberal: e.celeberal,
                redarded: e.redarded,
                multiDisable: e.multiDisable,
                mental: e.mental,
                notAvailable: e.notAvailable,
                totalDisabilityStatus: e.totalDisabilityStatus);
            await addDisability(disabilityOfflineData);
          }
          emit(DisabilitySuccessState(disabilityModel: fetchedDisabilityData));
        } else {
          if (cacheData.isNotEmpty) {
            final cacheModel = cacheData.map((e) {
              return DisabilityModel(
                  wardNumber: e.wardNumber,
                  able: e.able,
                  disable: e.disable,
                  deaf: e.deaf,
                  blind: e.blind,
                  hearingLoss: e.hearingLoss,
                  slammer: e.slammer,
                  celeberal: e.celeberal,
                  redarded: e.redarded,
                  multiDisable: e.multiDisable,
                  mental: e.mental,
                  notAvailable: e.notAvailable,
                  totalDisabilityStatus: e.totalDisabilityStatus);
            }).toList();
            emit(DisabilitySuccessState(disabilityModel: cacheModel));
            return;
          } else {
            emit(DisabilityFailureState(
                errMsg:
                    'No internet connection and no cached data available.'));
          }
        }
      } catch (errMsg) {
        emit(DisabilityFailureState(errMsg: errMsg.toString()));
      }
    });
  }
}
