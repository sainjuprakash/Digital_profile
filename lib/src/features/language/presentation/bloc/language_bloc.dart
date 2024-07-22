import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:digital_profile/core/services/shared_preferences_service.dart';
import 'package:digital_profile/src/features/language/data/database/language_database.dart';
import 'package:digital_profile/src/features/language/data/table_helper/language_table_helper.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import '../../data/models/language_model.dart';
import '../../domain/repository/language_repository.dart';

part 'language_event.dart';
part 'language_state.dart';

class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  String baseUrl, endPoint;
  final LanguageRepository _languageRepository;
  LanguageBloc(
    this._languageRepository,
    this.baseUrl,
    this.endPoint,
  ) : super(LanguageLoadingState()) {
    on<LoadLanguageEvent>((event, emit) async {
      try {
        final prefs = await PrefsService.getInstance();
        final gauPalika = prefs.getString(PrefsServiceKeys.villageName);
        final connectivityResults = await Connectivity().checkConnectivity();
        if (connectivityResults == ConnectivityResult.wifi ||
            connectivityResults == ConnectivityResult.mobile) {
          await clearLanguageData();
          List<LanguageModel> fetchedLanguageData =
              await _languageRepository.getLanguageData(baseUrl, endPoint);
          for (var e in fetchedLanguageData) {
            final languageModel = LanguageTableData(
                villageName: gauPalika!,
                wardNo: e.wardNo,
                nepali: e.nepali,
                tamang: e.tamang,
                sherpa: e.sherpa,
                limbu: e.limbu,
                rai: e.rai,
                gurung: e.gurung,
                ghale: e.ghale,
                othersLanguage: e.othersLanguage,
                notAvailable: e.notAvailable,
                totalLanguageCount: e.totalLanguageCount);
            await addLanguageData(languageModel);
          }

          emit(LanguageLoadedState(fetchedLanguageModel: fetchedLanguageData));
        } else {
          final cacheData = await getAllLanguageData();
          final villageNames =
              cacheData.map((data) => data.villageName).toSet();
          if (cacheData.isNotEmpty && villageNames.contains(gauPalika)) {
            final cacheModel = cacheData.map((e) {
              return LanguageModel(
                  wardNo: e.wardNo,
                  nepali: e.nepali,
                  tamang: e.tamang,
                  sherpa: e.sherpa,
                  limbu: e.limbu,
                  rai: e.rai,
                  gurung: e.gurung,
                  ghale: e.ghale,
                  othersLanguage: e.othersLanguage,
                  notAvailable: e.notAvailable,
                  totalLanguageCount: e.totalLanguageCount);
            }).toList();
            emit(LanguageLoadedState(fetchedLanguageModel: cacheModel));
            return;
          }
          emit(LanguageFailureState(
              errmsg: 'No internet connection and no cached data available'));
        }
      } catch (errMsg) {
        emit(LanguageFailureState(errmsg: errMsg.toString()));
      }
    });
  }
}
