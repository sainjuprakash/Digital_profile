import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:digital_profile/src/features/electricity/data/database/electricity_database.dart';
import 'package:digital_profile/src/features/electricity/data/table_helper/electricity_table_helper.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../../../core/services/shared_preferences_service.dart';
import '../../data/model/electricity_model.dart';
import '../../domain/repository/electricity_repository.dart';

part 'electricity_event.dart';
part 'electricity_state.dart';

class ElectricityBloc extends Bloc<ElectricityEvent, ElectricityState> {
  String baseUrl, endPoint;
  ElectricityRepository _electricityRepository;
  ElectricityBloc(this._electricityRepository, this.baseUrl, this.endPoint)
      : super(ElectricityLoadingState()) {
    on<GetElectricityEvent>((event, emit) async {
      try {
        final prefs = await PrefsService.getInstance();
        final gauPalika = prefs.getString(PrefsServiceKeys.villageName);
        final connectivityResults = await Connectivity().checkConnectivity();
        if (connectivityResults == ConnectivityResult.wifi ||
            connectivityResults == ConnectivityResult.mobile) {
          await clearElectricityData();
          List<ElectricityModel> fetchedElectricityModel =
              await _electricityRepository.getElectricityData(
                  baseUrl, endPoint);
          for (var e in fetchedElectricityModel) {
            var electricityData = ElectricityTableData(
                villageName: gauPalika!,
                wardNumber: e.wardNumber,
                kerosene: e.kerosene,
                bioGas: e.bioGas,
                solar: e.solar,
                electricityLaghu: e.electricityLaghu,
                electricityNational: e.electricityNational,
                others: e.others,
                notAvailable: e.notAvailable,
                totalHouseCount: e.totalHouseCount);
            await addElectricityData(electricityData);
          }
          emit(ElectricitySuccessState(
              electricityModel: fetchedElectricityModel));
        } else {
          final cacheData = await getAllElectricityData();
          final villageName = cacheData.map((e) => e.villageName).toSet();
          if (cacheData.isNotEmpty && villageName.contains(gauPalika)) {
            final cacheModel = cacheData.map((e) {
              return ElectricityModel(
                  wardNumber: e.wardNumber,
                  kerosene: e.kerosene,
                  bioGas: e.bioGas,
                  solar: e.solar,
                  electricityLaghu: e.electricityLaghu,
                  electricityNational: e.electricityNational,
                  others: e.others,
                  notAvailable: e.notAvailable,
                  totalHouseCount: e.totalHouseCount);
            }).toList();
            emit(ElectricitySuccessState(electricityModel: cacheModel));
          } else {
            emit(ElectricityFailureState(
                errMsg:
                    'No internet connection and no cached data available.'));
          }
        }
      } catch (errMsg) {
        emit(ElectricityFailureState(errMsg: errMsg.toString()));
      }
    });
  }
}
