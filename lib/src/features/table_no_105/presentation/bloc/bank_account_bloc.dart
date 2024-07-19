import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:digital_profile/src/features/table_no_105/data/database/bank_account_database.dart';
import 'package:digital_profile/src/features/table_no_105/data/table_helper/bank_account_table_helper.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../data/model/bank_account_model.dart';
import '../../domain/repository/bank_account_repository.dart';

part 'bank_account_event.dart';
part 'bank_account_state.dart';

class BankAccountBloc extends Bloc<BankAccountEvent, BankAccountState> {
  BankAccountRepository bankAccountRepository;
  String baseUrl, endPoint;
  BankAccountBloc(this.bankAccountRepository, this.baseUrl, this.endPoint)
      : super(BankAccountLoadingState()) {
    on<GetBankAccountEvent>((event, emit) async {
      try {
        final cacheData = await getAllBankAccountData();
        final connectivityResults = await Connectivity().checkConnectivity();
        if (connectivityResults == ConnectivityResult.wifi ||
            connectivityResults == ConnectivityResult.mobile) {
          await clearBankAccountData();
          List<BankAccountModel> fetchedModel =
              await bankAccountRepository.getBankDetails(baseUrl, endPoint);
          for (var e in fetchedModel) {
            final bankData = BankAccountTableData(
                wardNumber: e.wardNumber,
                devBank: e.devBank,
                commercialBank: e.commercialBank,
                sahakari: e.sahakari,
                bitiyaSanstha: e.bitiyaSanstha,
                notAvailable: e.notAvailable,
                total: e.total,
                totalBankCount: e.totalBankCount);
            await addBankAccountData(bankData);
          }
          emit(BankAccountSuccessState(fetchedModel));
        } else {
          if (cacheData.isNotEmpty) {
            final cacheModel = cacheData.map((e) {
              return BankAccountModel(
                  wardNumber: e.wardNumber,
                  devBank: e.devBank,
                  commercialBank: e.commercialBank,
                  sahakari: e.sahakari,
                  bitiyaSanstha: e.bitiyaSanstha,
                  notAvailable: e.notAvailable,
                  total: e.total,
                  totalBankCount: e.totalBankCount);
            }).toList();
            emit(BankAccountSuccessState(cacheModel));
            return;
          } else {
            emit(BankAccountFailureState(
                'No internet connection and no cached data available'));
          }
        }
      } catch (errMsg) {
        emit(BankAccountFailureState(errMsg.toString()));
      }
    });
  }
}
