import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:digital_profile/src/features/ethnicity_population/data/database/ethnicity_population_database.dart';
import 'package:digital_profile/src/features/ethnicity_population/data/model/ethnicity_population_model.dart';
import 'package:digital_profile/src/features/ethnicity_population/data/table_helper/ethnicity_population_table_helper.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../../../core/services/shared_preferences_service.dart';
import '../../domain/repository/ethnicity_population_repository.dart';

part 'ethnicity_population_event.dart';
part 'ethnicity_population_state.dart';

class EthnicityPopulationBloc
    extends Bloc<EthnicityPopulationEvent, EthnicityPopulationState> {
  String baseUrl, endPoint;
  final EthnicityPopulationRepository _ethnicityPopulationRepository;
  EthnicityPopulationBloc(
      this._ethnicityPopulationRepository, this.baseUrl, this.endPoint)
      : super(EthnicityPopulationLoadingState()) {
    on<GetEthnicityPopulationEvent>((event, emit) async {
      try {
        final prefs = await PrefsService.getInstance();
        final gauPalika = prefs.getString(PrefsServiceKeys.villageName);
        final cacheData = await getALlEthnicityPop();
        final connectivityResult = await Connectivity().checkConnectivity();
        if (connectivityResult == ConnectivityResult.wifi ||
            connectivityResult == ConnectivityResult.mobile) {
          await clearEthnicityPopulationData();
          List<EthnicityPopulationModel> ethnicityPopulationModel =
              await _ethnicityPopulationRepository.getEthnicityPopulation(
                  baseUrl, endPoint);
          for (var e in ethnicityPopulationModel) {
            final ethnicityModel = EthnicityPopTableData(
              villageName  : gauPalika!,
                wardNumber: e.wardNumber,
                hillBrahman: e.hillBrahman,
                teraiBrahman: e.teraiBrahman,
                hillJanajati: e.hillJanajati,
                teraiJanajati: e.teraiJanajati,
                hillDalit: e.hillDalit,
                muslim: e.muslim,
                others: e.others,
                notAvailable: e.notAvailable,
                totalEthnicity: e.totalWardEthnicity);
            await addEthnicityPop(ethnicityModel);
            emit(EthnicityPopulationSuccessState(
                ethnicityPopulationModel: ethnicityPopulationModel));
          }
        } else {

          final villageNames =
          cacheData.map((data) => data.villageName).toSet();
          if (cacheData.isNotEmpty && villageNames.contains(gauPalika)) {
            final cacheModel = cacheData.map((e) {
              return EthnicityPopulationModel(
                  wardNumber: e.wardNumber,
                  hillBrahman: e.hillBrahman,
                  teraiBrahman: e.teraiBrahman,
                  hillJanajati: e.hillJanajati,
                  teraiJanajati: e.teraiJanajati,
                  hillDalit: e.hillDalit,
                  muslim: e.muslim,
                  others: e.others,
                  notAvailable: e.notAvailable,
                  totalWardEthnicity: e.totalEthnicity);
            }).toList();
            emit(EthnicityPopulationSuccessState(
                ethnicityPopulationModel: cacheModel));
            return;
          } else {
            emit(EthnicityPopulationFailureState(
                errMsg: 'No internet connection and no cached data available'));
          }
        }
      } catch (errMsg) {
        emit(EthnicityPopulationFailureState(errMsg: errMsg.toString()));
      }
    });
  }
}
