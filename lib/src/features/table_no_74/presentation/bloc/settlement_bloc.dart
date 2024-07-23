import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:digital_profile/src/features/table_no_74/data/table_helper/settlement_table_helper.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../../../core/services/shared_preferences_service.dart';
import '../../data/database/settlement_database.dart';
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
        final prefs = await PrefsService.getInstance();
        final gauPalika = prefs.getString(PrefsServiceKeys.villageName);
        final connectivityResults = await Connectivity().checkConnectivity();
        if (connectivityResults == ConnectivityResult.wifi ||
            connectivityResults == ConnectivityResult.mobile) {
          await clearSettlementData();
          List<SettlementModel> fetchedModel =
              await settlementRepository.getSettlementData(baseUrl, endPoint);
          for (var e in fetchedModel) {
            var settlementData = SettlementTableData(
                villageName: gauPalika!,
                wardNumber: e.wardNumber,
                permanent: e.permanent,
                temporary: e.temporary,
                others: e.others,
                total: e.total);
            await addSettlementData(settlementData);
          }
          emit(SettlementSuccessState(fetchedModel));
        } else {
          final cacheData = await getAllSettlementData();
          final villageName = cacheData.map((e) => e.villageName).toSet();
          if (cacheData.isNotEmpty && villageName.contains(gauPalika)) {
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
