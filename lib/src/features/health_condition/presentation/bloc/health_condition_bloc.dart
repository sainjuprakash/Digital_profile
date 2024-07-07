import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:digital_profile/src/features/health_condition/data/database/health_condition_database.dart';
import 'package:digital_profile/src/features/health_condition/data/table_helper/health_condition_table_helper.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../data/model/health_condition_model.dart';
import '../../domain/repository/health_condition_repository.dart';

part 'health_condition_event.dart';
part 'health_condition_state.dart';

class HealthConditionBloc
    extends Bloc<HealthConditionEvent, HealthConditionState> {
  String baseUrl, endPoints;
  HealthConditionRepository _healthConditionRepository;
  HealthConditionBloc(
      this._healthConditionRepository, this.baseUrl, this.endPoints)
      : super(HealthConditionLoadingState()) {
    on<GetHealthConditionEvent>((event, emit) async {
      try {
        final cacheData = await getAllHealthData();
        if (cacheData.isNotEmpty) {
          final cacheModel = cacheData.map((e) {
            return HealthConditionModel(
                wardNumber: e.wardNumber,
                healthy: e.healthy,
                generalDisease: e.generalDisease,
                longTermDisease: e.longTermDisease,
                covid: e.covid,
                notAvailable: e.notAvailable,
                totalWardHealthCondition: e.totalWardHealthCondition);
          }).toList();
          emit(HealthConditionSuccessState(healthConditionModel: cacheModel));
          return;
        }
        final connectivityResults = await Connectivity().checkConnectivity();
        if (connectivityResults == ConnectivityResult.wifi ||
            connectivityResults == ConnectivityResult.mobile) {
          List<HealthConditionModel> fetchedHealthModel =
              await _healthConditionRepository.getHealthCondition(
                  baseUrl, endPoints);
          for (var e in fetchedHealthModel) {
            print(e);
            var healthData = HealthConditionTableData(
                wardNumber: e.wardNumber,
                healthy: e.healthy,
                generalDisease: e.generalDisease,
                longTermDisease: e.longTermDisease,
                covid: e.covid,
                notAvailable: e.notAvailable,
                totalWardHealthCondition: e.totalWardHealthCondition);
            await addHealthData(healthData);
          }

          emit(HealthConditionSuccessState(
              healthConditionModel: fetchedHealthModel));
        } else {
          if (cacheData.isNotEmpty) {
            final cacheModel = cacheData.map((e) {
              return HealthConditionModel(
                  wardNumber: e.wardNumber,
                  healthy: e.healthy,
                  generalDisease: e.generalDisease,
                  longTermDisease: e.longTermDisease,
                  covid: e.covid,
                  notAvailable: e.notAvailable,
                  totalWardHealthCondition: e.totalWardHealthCondition);
            }).toList();
            emit(HealthConditionSuccessState(healthConditionModel: cacheModel));
          } else {
            emit(HealthConditionFailureState(
                errMsg:
                    'No internet connection and no cached data available.'));
          }
        }
      } catch (errMsg) {
        emit(HealthConditionFailureState(errMsg: errMsg.toString()));
      }
    });
  }
}
