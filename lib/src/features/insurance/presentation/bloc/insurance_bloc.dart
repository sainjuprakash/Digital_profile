import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:digital_profile/src/features/insurance/data/database/insurance_database.dart';
import 'package:digital_profile/src/features/insurance/data/table_helper/insurance_table_helper.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../data/model/insurance_model.dart';
import '../../domain/repository/insurance_repository.dart';

part 'insurance_event.dart';
part 'insurance_state.dart';

class InsuranceBloc extends Bloc<InsuranceEvent, InsuranceState> {
  String baseUrl, endPoint;
  InsuranceRepository _insuranceRepository;
  InsuranceBloc(this._insuranceRepository, this.baseUrl, this.endPoint)
      : super(InsuranceLoadingState()) {
    on<GetInsuranceEvent>((event, emit) async {
      try {
        final cacheData = await getAllInsuranceData();
        if (cacheData.isNotEmpty) {
          final cacheModel = cacheData.map((e) {
            return InsuranceModel(
                wardNumber: e.wardNumber,
                lifeInsurance: e.lifeInsurance,
                healthInsurance: e.healthInsurance,
                liveStockInsurance: e.liveStockInsurance,
                othersInsurance: e.othersInsurance,
                notAvailable: e.notAvailable,
                totalInsurance: e.totalInsurance);
          }).toList();
          emit(InsuranceSuccessState(insuranceModel: cacheModel));
          return;
        }
        final connectivityResults = await Connectivity().checkConnectivity();
        if (connectivityResults == ConnectivityResult.wifi ||
            connectivityResults == ConnectivityResult.mobile) {
          List<InsuranceModel> fetchedInsModel =
              await _insuranceRepository.getInsuranceData(baseUrl, endPoint);
          for (var e in fetchedInsModel) {
            var insuranceModel = InsuranceTableData(
                wardNumber: e.wardNumber,
                lifeInsurance: e.lifeInsurance,
                healthInsurance: e.healthInsurance,
                liveStockInsurance: e.liveStockInsurance,
                othersInsurance: e.othersInsurance,
                notAvailable: e.notAvailable,
                totalInsurance: e.totalInsurance);
            await addInsuranceData(insuranceModel);
          }
          emit(InsuranceSuccessState(insuranceModel: fetchedInsModel));
        } else {
          if (cacheData.isNotEmpty) {
            final cacheModel = cacheData.map((e) {
              return InsuranceModel(
                  wardNumber: e.wardNumber,
                  lifeInsurance: e.lifeInsurance,
                  healthInsurance: e.healthInsurance,
                  liveStockInsurance: e.liveStockInsurance,
                  othersInsurance: e.othersInsurance,
                  notAvailable: e.notAvailable,
                  totalInsurance: e.totalInsurance);
            }).toList();
            emit(InsuranceSuccessState(insuranceModel: cacheModel));
            return;
          } else {
            InsuranceFailureState(
                errMsg: 'No internet connection and no cached data available');
          }
        }
      } catch (errMsg) {
        emit(InsuranceFailureState(errMsg: errMsg.toString()));
      }
    });
  }
}
