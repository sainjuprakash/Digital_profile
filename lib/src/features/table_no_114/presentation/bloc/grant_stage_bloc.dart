import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:digital_profile/src/features/table_no_113/data/table_helper/earthquake_grant_table_helper.dart';
import 'package:digital_profile/src/features/table_no_114/data/database/grant_stage_database.dart';
import 'package:digital_profile/src/features/table_no_114/data/table_helper/grant_stage_table_helper.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../data/model/grant_stage_model.dart';
import '../../domain/repository/grant_stage_repository.dart';

part 'grant_stage_event.dart';
part 'grant_stage_state.dart';

class GrantStageBloc extends Bloc<GrantStageEvent, GrantStageState> {
  GrantStageRepository grantStageRepository;
  String baseUrl, endPoint;
  GrantStageBloc(this.grantStageRepository, this.baseUrl, this.endPoint)
      : super(GrantStageLoadingState()) {
    on<GetGrantStageEvent>((event, emit) async {
      try {
        final cacheData = await getAllGrantStage();
        final connectivityResults = await Connectivity().checkConnectivity();
        if (connectivityResults == ConnectivityResult.wifi ||
            connectivityResults == ConnectivityResult.mobile) {
          await clearGrantStageData();
          List<GrantStageModel> fetchedModel =
              await grantStageRepository.getGrantData(baseUrl, endPoint);
          for (var e in fetchedModel) {
            var grantModel = GrantStageTableData(
                wardNumber: e.wardNumber,
                firstStage: e.firstStage,
                secondStage: e.secondStage,
                thirdStage: e.thirdStage,
                notAvailable: e.notAvailable,
                total: e.total);
            await addGrantStageData(grantModel);
          }
          emit(GrantStageSuccessState(fetchedModel));
        } else {
          if (cacheData.isNotEmpty) {
            final cacheModel = cacheData.map((e) {
              return GrantStageModel(
                  wardNumber: e.wardNumber,
                  firstStage: e.firstStage,
                  secondStage: e.secondStage,
                  thirdStage: e.thirdStage,
                  notAvailable: e.notAvailable,
                  total: e.total);
            }).toList();
            emit(GrantStageSuccessState(cacheModel));
            return;
          } else {
            emit(GrantStageFailureState(
                'No internet connection and no cached data available'));
          }
        }
      } catch (errMsg) {
        emit(GrantStageFailureState(errMsg.toString()));
      }
    });
  }
}
