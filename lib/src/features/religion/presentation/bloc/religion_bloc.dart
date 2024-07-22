import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:digital_profile/core/services/shared_preferences_service.dart';
import 'package:digital_profile/src/features/religion/data/database/religion_database.dart';
import 'package:digital_profile/src/features/religion/data/table_helper/religion_table_helper.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../data/model/religion_model.dart';
import '../../domain/repository/religion_repository.dart';

part 'religion_event.dart';
part 'religion_state.dart';

class ReligionBloc extends Bloc<ReligionEvent, ReligionState> {
  String baseUrl, endPoint;
  final ReligionRepository _religionRepository;
  ReligionBloc(this._religionRepository, this.baseUrl, this.endPoint)
      : super(ReligionLoadingState()) {
    on<GetReligionEvent>((event, emit) async {
      try {
        final prefs = await PrefsService.getInstance();
        final gauPalika = prefs.getString(PrefsServiceKeys.villageName);
        final connectivityResults = await Connectivity().checkConnectivity();
        if (connectivityResults == ConnectivityResult.wifi ||
            connectivityResults == ConnectivityResult.mobile) {
          await clearReligionData();
          List<ReligionModel> religionModel =
              await _religionRepository.getReligionData(baseUrl, endPoint);
          for (var e in religionModel) {
            var religionData = ReligionTableData(
              villageName: gauPalika!,
              wardNumber: e.wardNumber,
              hindu: e.hindu,
              boudha: e.boudha,
              christian: e.christian,
              muslim: e.muslim,
              kirat: e.kirat,
              jains: e.jains,
              bon: e.bon,
              others: e.others,
              notAvailable: e.notAvailable,
              wardRelCount: e.wardRelCount,
            );
            await addReligion(religionData);
          }
          emit(ReligionSuccessState(religionModel: religionModel));
        } else {
          final cacheData = await getALlReligionData();
          final villageName = cacheData.map((e) => e.villageName).toSet();
          if (cacheData.isNotEmpty && villageName.contains(gauPalika)) {
            final cacheModel = cacheData.map((e) {
              return ReligionModel(
                  wardNumber: e.wardNumber,
                  hindu: e.hindu,
                  boudha: e.boudha,
                  christian: e.christian,
                  muslim: e.muslim,
                  kirat: e.kirat,
                  jains: e.jains,
                  bon: e.bon,
                  others: e.others,
                  notAvailable: e.notAvailable,
                  wardRelCount: e.wardRelCount);
            }).toList();
            emit(ReligionSuccessState(religionModel: cacheModel));
          } else {
            emit(ReligionFailureState(
                errMsg:
                    'No internet connection and no cached data available.'));
          }
        }
      } catch (errMsg) {
        print(errMsg);
        emit(ReligionFailureState(errMsg: errMsg.toString()));
      }
    });
  }
}
