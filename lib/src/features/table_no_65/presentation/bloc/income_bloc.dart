import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:digital_profile/src/features/table_no_65/data/database/income_database.dart';
import 'package:digital_profile/src/features/table_no_65/data/table_helper/income_table_helper.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../../../core/services/shared_preferences_service.dart';
import '../../data/model/income_model.dart';
import '../../domain/repository/income_repository.dart';

part 'income_event.dart';
part 'income_state.dart';

class IncomeBloc extends Bloc<IncomeEvent, IncomeState> {
  IncomeRepository incomeRepository;
  String baseUrl, endPoint;
  IncomeBloc(this.incomeRepository, this.baseUrl, this.endPoint)
      : super(IncomeLoadingState()) {
    on<GetIncomeEvent>((event, emit) async {
      try {
        final prefs = await PrefsService.getInstance();
        final gauPalika = prefs.getString(PrefsServiceKeys.villageName);
        final connectivityResults = await Connectivity().checkConnectivity();
        if (connectivityResults == ConnectivityResult.wifi ||
            connectivityResults == ConnectivityResult.mobile) {
          await clearIncomeData();
          List<IncomeModel> fetchedModel =
              await incomeRepository.getIncomeData(baseUrl, endPoint);
          for (var e in fetchedModel) {
            var incomeData = IncomeTableData(
                villageName: gauPalika!,
                wardNumber: e.wardNumber,
                crops: e.crops,
                fruits: e.fruits,
                livestock: e.livestock,
                vegi: e.vegi,
                medi: e.medi,
                labour: e.labour,
                business: e.business,
                foreignEmp: e.foreignEmp,
                office: e.office,
                others: e.others,
                total: e.total);
            await addIncomeData(incomeData);
          }
          emit(IncomeSuccessState(fetchedModel));
        } else {
          final cacheData = await getAllIncomeData();
          final villageName = cacheData.map((e) => e.villageName).toSet();
          if (cacheData.isNotEmpty && villageName.contains(gauPalika)) {
            final cacheModel = cacheData.map((e) {
              return IncomeModel(
                  wardNumber: e.wardNumber,
                  crops: e.crops,
                  fruits: e.fruits,
                  livestock: e.livestock,
                  vegi: e.vegi,
                  medi: e.medi,
                  labour: e.labour,
                  business: e.business,
                  foreignEmp: e.foreignEmp,
                  office: e.office,
                  others: e.others,
                  total: e.total);
            }).toList();
            emit(IncomeSuccessState(cacheModel));
            return;
          } else {
            emit(IncomeFailureState(
                'No internet connection and no cached data available'));
          }
        }
      } catch (errMsg) {
        emit(IncomeFailureState(errMsg.toString()));
      }
    });
  }
}
