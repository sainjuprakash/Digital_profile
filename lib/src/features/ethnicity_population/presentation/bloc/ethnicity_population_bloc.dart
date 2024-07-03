import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:digital_profile/src/features/ethnicity_population/data/database/ethnicity_population_database.dart';
import 'package:digital_profile/src/features/ethnicity_population/data/model/ethnicity_population_model.dart';
import 'package:digital_profile/src/features/ethnicity_population/data/table_helper/ethnicity_population_table_helper.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

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
        final cacheData = await getALlEthnicityPop();
        if (cacheData.isNotEmpty) {
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
        }

        final connectivityResult = await Connectivity().checkConnectivity();
        if (connectivityResult == ConnectivityResult.wifi ||
            connectivityResult == ConnectivityResult.mobile) {
          List<EthnicityPopulationModel> ethnicityPopulationModel =
              await _ethnicityPopulationRepository.getEthnicityPopulation(
                  baseUrl, endPoint);
          for (var e in ethnicityPopulationModel) {
            final ethnicityModel = EthnicityPopTableData(
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
          if (cacheData.isNotEmpty) {
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
