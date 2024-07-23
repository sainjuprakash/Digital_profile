import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:digital_profile/src/features/table_no_34/data/database/occupation_database.dart';
import 'package:digital_profile/src/features/table_no_34/data/table_helper/occupation_table_helper.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../../../core/services/shared_preferences_service.dart';
import '../../data/model/occupation_model.dart';
import '../../domain/repository/occupation_repository.dart';

part 'occupation_event.dart';
part 'occupation_state.dart';

class OccupationBloc extends Bloc<OccupationEvent, OccupationState> {
  OccupationRepository occupationRepository;
  String baseUrl, endPoint;
  OccupationBloc(this.occupationRepository, this.baseUrl, this.endPoint)
      : super(OccupationLoadingState()) {
    on<OccupationEvent>((event, emit) async {
      try {
        final prefs = await PrefsService.getInstance();
        final gauPalika = prefs.getString(PrefsServiceKeys.villageName);
        final connectivityResults = await Connectivity().checkConnectivity();
        if (connectivityResults == ConnectivityResult.wifi ||
            connectivityResults == ConnectivityResult.mobile) {
          await clearOccupationData();
          List<OccupationModel> fetchedModel =
              await occupationRepository.getOccupationData(baseUrl, endPoint);
          for (var e in fetchedModel) {
            var occupationModel = OccupationTableData(
                villageName: gauPalika!,
                wardNumber: e.wardNumber,
                agriculture: e.agriculture,
                office: e.office,
                business: e.business,
                worker: e.worker,
                entrepreneur: e.entrepreneur,
                foreignEmp: e.foreignEmp,
                student: e.student,
                houseWife: e.houseWife,
                unemployed: e.unemployed,
                underage: e.underage,
                pension: e.pension,
                technical: e.technical,
                seniorCtzn: e.seniorCtzn,
                others: e.others,
                notAvailable: e.notAvailable,
                total: e.total);
            await addOccupation(occupationModel);
          }
          emit(OccupationSuccessState(fetchedModel));
        } else {
          final cacheData = await getAllOccupationData();
          final villageName = cacheData.map((e) => e.villageName).toSet();
          if (cacheData.isNotEmpty && villageName.contains(gauPalika)) {
            final cacheModel = cacheData.map((e) {
              return OccupationModel(
                  wardNumber: e.wardNumber,
                  agriculture: e.agriculture,
                  office: e.office,
                  business: e.business,
                  worker: e.worker,
                  entrepreneur: e.entrepreneur,
                  foreignEmp: e.foreignEmp,
                  student: e.student,
                  houseWife: e.houseWife,
                  unemployed: e.unemployed,
                  underage: e.underage,
                  pension: e.pension,
                  technical: e.technical,
                  seniorCtzn: e.seniorCtzn,
                  others: e.others,
                  notAvailable: e.notAvailable,
                  total: e.total);
            }).toList();
            emit(OccupationSuccessState(cacheModel));
            return;
          } else {
            emit(OccupationFailureState(
                'No internet connection and no cached data available'));
          }
        }
      } catch (errMsg) {
        emit(OccupationFailureState(errMsg.toString()));
      }
    });
  }
}
