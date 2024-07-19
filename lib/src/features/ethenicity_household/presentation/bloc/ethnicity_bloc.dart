import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:digital_profile/src/features/ethenicity_household/data/database/ethnicity_household_database.dart';
import 'package:digital_profile/src/features/ethenicity_household/data/table_helper/ethnicity_household_table_helper.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../data/models/ethnicity_model.dart';
import '../../domain/repository/ethnicity_repository.dart';

part 'ethnicity_event.dart';
part 'ethnicity_state.dart';

class EthnicityBloc extends Bloc<EthnicityEvent, EthnicityState> {
  String baseUrl, endPoint;
  final EthnicityRepository _ethnicityRepository;
  EthnicityBloc(this._ethnicityRepository, this.baseUrl, this.endPoint)
      : super(EthnicityLoadingState()) {
    on<LoadEthnicityEvent>((event, emit) async {
      try {
        final cacheData = await getALlEthnicityHousehold();
        final connectivityResult = await Connectivity().checkConnectivity();
        if (connectivityResult == ConnectivityResult.wifi ||
            connectivityResult == ConnectivityResult.mobile) {
          await clearEthnicityHouseholdData();
          List<EthnicityModel> ethnicityModel =
              await _ethnicityRepository.getEthnicityData(baseUrl, endPoint);
          for (var e in ethnicityModel) {
            final ethnicityModel = EthnicityHhTableData(
                wardNumber: e.wardNumber,
                muslim: e.muslim,
                hillBrahman: e.hillBrahman,
                teraiBrahman: e.teraiBrahman,
                hillJanajati: e.hillJanajati,
                teraiJanajati: e.teraiJanajati,
                hillDalit: e.hillDalit,
                notAvailable: e.notAvailable,
                totalEthnicity: e.totalEthnicity);
            await addEthnicityHousehold(ethnicityModel);
          }
          emit(EthnicitySuccessState(fetchedEthnicityModel: ethnicityModel));
        } else {
          if (cacheData.isNotEmpty) {
            final cacheModel = cacheData.map((e) {
              return EthnicityModel(
                  wardNumber: e.wardNumber,
                  muslim: e.muslim,
                  hillBrahman: e.hillBrahman,
                  teraiBrahman: e.teraiBrahman,
                  hillJanajati: e.hillJanajati,
                  teraiJanajati: e.teraiJanajati,
                  hillDalit: e.hillDalit,
                  notAvailable: e.notAvailable,
                  totalEthnicity: e.totalEthnicity);
            }).toList();
            emit(EthnicitySuccessState(fetchedEthnicityModel: cacheModel));
            return;
          } else {
            emit(EthnicityFailureState(
                errmsg: 'No internet connection and no cached data available'));
          }
        }
      } catch (errorMsg) {
        emit(EthnicityFailureState(errmsg: errorMsg.toString()));
      }
    });
  }
}
