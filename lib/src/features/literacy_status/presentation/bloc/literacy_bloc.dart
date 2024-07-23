import 'package:bloc/bloc.dart';
import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:digital_profile/core/services/shared_preferences_service.dart';
import 'package:digital_profile/src/features/literacy_status/data/database/literacy_database.dart';
import 'package:digital_profile/src/features/literacy_status/data/table_helper/literacy_table_helper.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../data/model/literacy_model.dart';
import '../../domain/repository/literacy_repository.dart';

part 'literacy_event.dart';
part 'literacy_state.dart';

class LiteracyBloc extends Bloc<LiteracyEvent, LiteracyState> {
  String baseUrl, endPoints;
  LiteracyRepository _literacyRepository;
  LiteracyBloc(this._literacyRepository, this.baseUrl, this.endPoints)
      : super(LiteracyLoadingState()) {
    on<LiteracyEvent>((event, emit) async {
      try {
        final prefs = await PrefsService.getInstance();
        final gauPalika = prefs.getString(PrefsServiceKeys.villageName);
        final connectivityResults = await Connectivity().checkConnectivity();
        if (connectivityResults == ConnectivityResult.wifi ||
            connectivityResults == ConnectivityResult.mobile) {
          await clearLiteracyData();
          List<LiteracyModel> fetchedLiteracyData =
              await _literacyRepository.getLiteracyData(baseUrl, endPoints);
          for (var e in fetchedLiteracyData) {
            var literacyOfflineData = LiteracyTableData(
                villageName: gauPalika!,
                wardNumber: e.wardNumber,
                maleLiterate: e.maleLiterate,
                malePrePrimary: e.malePrePrimary,
                malePrimary: e.malePrimary,
                maleSecondary: e.maleSecondary,
                maleTechnical: e.maleTechnical,
                maleBachelor: e.maleBachelor,
                maleMasters: e.maleMasters,
                maleMphil: e.maleMphil,
                maleUnderAge: e.maleUnderAge,
                maleIlitrate: e.maleIlitrate,
                maleNotAvailable: e.maleNotAvailable,
                femaleLiterate: e.femaleLiterate,
                femalePrePrimary: e.femalePrePrimary,
                femalePrimary: e.femalePrimary,
                femaleSecondary: e.femaleSecondary,
                femaleTechincal: e.femaleTechincal,
                femaleBachelor: e.femaleBachelor,
                femaleMasters: e.femaleMasters,
                femaleMphil: e.femaleMphil,
                femaleUnderAge: e.femaleUnderAge,
                femaleIliterate: e.femaleIliterate,
                femaleNotAvailable: e.femaleNotAvailable,
                othersLiterate: e.othersLiterate,
                othersPrePrimary: e.othersPrePrimary,
                othersPrimary: e.othersPrimary,
                othersSecondary: e.othersSecondary,
                othersTechnical: e.othersTechnical,
                othersBachelor: e.othersBachelor,
                othersMasters: e.othersMasters,
                othersMphil: e.othersMphil,
                othersUnderAge: e.othersUnderAge,
                othersIliterate: e.othersIliterate,
                othersNotAvailable: e.othersNotAvailable,
                totalWardEdu: e.totalWardEdu);
            await addLiteracy(literacyOfflineData);
          }
          emit(LiteracySuccessState(literacyModel: fetchedLiteracyData));
        } else {
          final cacheData = await getAllLiteracyData();
          final villageName = cacheData.map((e) => e.villageName).toSet();
          if (cacheData.isNotEmpty && villageName.contains(gauPalika)) {
            print(gauPalika);
            print(villageName);
            final cacheModel = cacheData.map((e) {
              return LiteracyModel(
                  wardNumber: e.wardNumber,
                  maleLiterate: e.maleLiterate,
                  malePrePrimary: e.malePrePrimary,
                  malePrimary: e.malePrimary,
                  maleSecondary: e.maleSecondary,
                  maleTechnical: e.maleTechnical,
                  maleBachelor: e.maleBachelor,
                  maleMasters: e.maleMasters,
                  maleMphil: e.maleMphil,
                  maleUnderAge: e.maleUnderAge,
                  maleIlitrate: e.maleIlitrate,
                  maleNotAvailable: e.maleNotAvailable,
                  femaleLiterate: e.femaleLiterate,
                  femalePrePrimary: e.femalePrePrimary,
                  femalePrimary: e.femalePrimary,
                  femaleSecondary: e.femaleSecondary,
                  femaleTechincal: e.femaleTechincal,
                  femaleBachelor: e.femaleBachelor,
                  femaleMasters: e.femaleMasters,
                  femaleMphil: e.femaleMphil,
                  femaleUnderAge: e.femaleUnderAge,
                  femaleIliterate: e.femaleIliterate,
                  femaleNotAvailable: e.femaleNotAvailable,
                  othersLiterate: e.othersLiterate,
                  othersPrePrimary: e.othersPrePrimary,
                  othersPrimary: e.othersPrimary,
                  othersSecondary: e.othersSecondary,
                  othersTechnical: e.othersTechnical,
                  othersBachelor: e.othersBachelor,
                  othersMasters: e.othersMasters,
                  othersMphil: e.othersMphil,
                  othersUnderAge: e.othersUnderAge,
                  othersIliterate: e.othersIliterate,
                  othersNotAvailable: e.othersNotAvailable,
                  totalWardEdu: e.totalWardEdu);
            }).toList();

            emit(LiteracySuccessState(literacyModel: cacheModel));
            return;
          } else {
            emit(LiteracyFailureState(
                errMsg:
                    'No internet connection and no cached data available.'));
          }
        }
      } catch (errMsg) {
        emit(LiteracyFailureState(errMsg: errMsg.toString()));
      }
    });
  }
}
