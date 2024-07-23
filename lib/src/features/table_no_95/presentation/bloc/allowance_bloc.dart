import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:digital_profile/src/features/table_no_95/data/table_helper/allowance_table_helper.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../../../core/services/shared_preferences_service.dart';
import '../../data/database/allowance_database.dart';
import '../../data/model/allowance_model.dart';
import '../../domain/repository/allowance_repository.dart';

part 'allowance_event.dart';
part 'allowance_state.dart';

class AllowanceBloc extends Bloc<AllowanceEvent, AllowanceState> {
  AllowanceRepository allowanceRepository;
  String baseUrl, endPoint;
  AllowanceBloc(this.allowanceRepository, this.baseUrl, this.endPoint)
      : super(AllowanceLoadingState()) {
    on<GetAllowanceEvent>((event, emit) async {
      try {
        final prefs = await PrefsService.getInstance();
        final gauPalika = prefs.getString(PrefsServiceKeys.villageName);
        final connectivityResults = await Connectivity().checkConnectivity();
        if (connectivityResults == ConnectivityResult.wifi ||
            connectivityResults == ConnectivityResult.mobile) {
          await clearAllowanceData();
          List<AllowanceModel> fetchedModel =
              await allowanceRepository.getAllowanceData(baseUrl, endPoint);
          for (var e in fetchedModel) {
            var allowanceModel = AllowanceTableData(
                villageName: gauPalika!,
                wardNumber: e.wardNumber,
                processWrong: e.processWrong,
                briddhaBhatta: e.briddhaBhatta,
                widow: e.widow,
                widower: e.widower,
                disabled: e.disabled,
                notTaken: e.notTaken,
                notProcessed: e.notProcessed,
                indigenous: e.indigenous,
                notAvailable: e.notAvailable,
                socialSecurity: e.socialSecurity);
            await addAllowanceData(allowanceModel);
          }
          emit(AllowanceSuccessState(fetchedModel));
        } else {
          final cacheData = await getAllAllowanceData();
          final villageName = cacheData.map((e) => e.villageName).toSet();
          if (cacheData.isNotEmpty && villageName.contains(gauPalika)) {
            final cacheModel = cacheData.map((e) {
              return AllowanceModel(
                  wardNumber: e.wardNumber,
                  processWrong: e.processWrong,
                  briddhaBhatta: e.briddhaBhatta,
                  widow: e.widow,
                  widower: e.widower,
                  disabled: e.disabled,
                  notTaken: e.notTaken,
                  notProcessed: e.notProcessed,
                  indigenous: e.indigenous,
                  notAvailable: e.notAvailable,
                  socialSecurity: e.socialSecurity);
            }).toList();
            emit(AllowanceSuccessState(cacheModel));
            return;
          } else {
            emit(AllowanceFailureState(
                'No internet connection and no cached data available'));
          }
        }
      } catch (errMsg) {
        emit(AllowanceFailureState(errMsg.toString()));
      }
    });
  }
}
