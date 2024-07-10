import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:digital_profile/src/features/table_no_37/data/database/bank_database.dart';
import 'package:digital_profile/src/features/table_no_37/data/table_helper/bank_table_helper.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../data/model/bank_model.dart';
import '../../domain/repository/bank_repository.dart';

part 'bank_event.dart';
part 'bank_state.dart';

class BankBloc extends Bloc<BankEvent, BankState> {
  BankRepository bankRepository;
  String baseUrl, endPoint;
  BankBloc(this.bankRepository, this.baseUrl, this.endPoint)
      : super(BankLoadingState()) {
    on<GetBankEvent>((event, emit) async {
      try {
        final cacheData = await getAllBankDetails();
        if (cacheData.isNotEmpty) {
          final cacheModel = cacheData.map((e) {
            return BankModel(
                wardNumber: e.wardNumber,
                bankAccount: e.bankAccount,
                noBankAccount: e.noBankAccount,
                wardHouses: e.wardHouses,
                totalBankAccount: e.totalBankAccount);
          }).toList();
          emit(BankSuccessState(cacheModel));
          return;
        }
        final connectivityResults = await Connectivity().checkConnectivity();
        if (connectivityResults == ConnectivityResult.wifi ||
            connectivityResults == ConnectivityResult.mobile) {
          List<BankModel> fetchedModel =
              await bankRepository.getBankData(baseUrl, endPoint);
          for (var e in fetchedModel) {
            final bankModel = BankTableData(
                wardNumber: e.wardNumber,
                bankAccount: e.bankAccount,
                noBankAccount: e.noBankAccount,
                wardHouses: e.wardHouses,
                totalBankAccount: e.totalBankAccount);
            await addBank(bankModel);
          }
          emit(BankSuccessState(fetchedModel));
        } else {
          if (cacheData.isNotEmpty) {
            final cacheModel = cacheData.map((e) {
              return BankModel(
                  wardNumber: e.wardNumber,
                  bankAccount: e.bankAccount,
                  noBankAccount: e.noBankAccount,
                  wardHouses: e.wardHouses,
                  totalBankAccount: e.totalBankAccount);
            }).toList();
            emit(BankSuccessState(cacheModel));
            return;
          } else {
            emit(BankFailureState(
                'No internet connection and no cached data available'));
          }
        }
      } catch (errMsg) {
        emit(BankFailureState(errMsg.toString()));
        print(errMsg.toString());
      }
    });
  }
}
