import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:digital_profile/src/features/table_no_74/data/database/settlement_database.dart';
import 'package:digital_profile/src/features/table_no_74/data/table_helper/settlement_table_helper.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../data/model/settlement_model.dart';
import '../../domain/repository/settlement_repository.dart';

part 'settlement_event.dart';
part 'settlement_state.dart';

class SettlementBloc extends Bloc<SettlementEvent, SettlementState> {
  SettlementRepository settlementRepository;
  String baseUrl, endPoint;
  SettlementBloc(this.settlementRepository, this.baseUrl, this.endPoint)
      : super(SettlementLoadingState()) {
    on<GetSettlementEvent>((event, emit) async {
      try {
        final cacheData = await getAllSettlementData();
        if (cacheData.isNotEmpty) {
          final cacheModel = cacheData.map((e) {
            return SettlementModel(
                wardNumber: e.wardNumber,
                permanent: e.permanent,
                temporary: e.temporary,
                others: e.others,
                total: e.total);
          }).toList();
          emit(SettlementSuccessState(cacheModel));
          return;
        }
        final connectivityResults = await Connectivity().checkConnectivity();
        if (connectivityResults == ConnectivityResult.wifi ||
            connectivityResults == ConnectivityResult.mobile) {
          List<SettlementModel> fetchedModel =
              await settlementRepository.getSettlementData(baseUrl, endPoint);
          for (var e in fetchedModel) {
            var settlementData = SettlementTableData(
                wardNumber: e.wardNumber,
                permanent: e.permanent,
                temporary: e.temporary,
                others: e.others,
                total: e.total);
            await addSettlementData(settlementData);
          }
          emit(SettlementSuccessState(fetchedModel));
        } else {
          if (cacheData.isNotEmpty) {
            final cacheModel = cacheData.map((e) {
              return SettlementModel(
                  wardNumber: e.wardNumber,
                  permanent: e.permanent,
                  temporary: e.temporary,
                  others: e.others,
                  total: e.total);
            }).toList();
            emit(SettlementSuccessState(cacheModel));
            return;
          } else {
            emit(SettlementFailureState(
                'No internet connection and no cached data available'));
          }
        }
      } catch (errMsg) {
        emit(SettlementFailureState(errMsg.toString()));
      }
    });
  }
}
