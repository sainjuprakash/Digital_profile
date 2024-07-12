import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:digital_profile/src/features/table_no_109/data/database/loan_database.dart';
import 'package:digital_profile/src/features/table_no_109/data/table_helper/loan_table_helper.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../data/model/loan_model.dart';
import '../../domain/repository/loan_repository.dart';

part 'loan_event.dart';
part 'loan_state.dart';

class LoanBloc extends Bloc<LoanEvent, LoanState> {
  LoanRepository loanRepository;
  String baseUrl, endPoint;
  LoanBloc(this.loanRepository, this.baseUrl, this.endPoint)
      : super(LoanLoadingState()) {
    on<GetLoanEvent>((event, emit) async {
      try {
        final cacheData = await getAllLoanData();
        if (cacheData.isNotEmpty) {
          final cacheModel = cacheData.map((e) {
            return LoanModel(
                wardNumber: e.wardNumber,
                agricultureLoan: e.agricultureLoan,
                houseExpLoan: e.houseExpLoan,
                businessLoan: e.businessLoan,
                foreignEmpLoan: e.foreignEmpLoan,
                educationLoan: e.educationLoan,
                medicalLoan: e.medicalLoan,
                othersLoan: e.othersLoan,
                notAvailable: e.notAvailable,
                wardHouses: e.wardHouses,
                totalLoan: e.totalLoan);
          }).toList();
          emit(LoanSuccessState(cacheModel));
          return;
        }
        final connectivityResults = await Connectivity().checkConnectivity();
        if (connectivityResults == ConnectivityResult.wifi ||
            connectivityResults == ConnectivityResult.mobile) {
          List<LoanModel> fetchedModel =
              await loanRepository.getLoanData(baseUrl, endPoint);
          for (var e in fetchedModel) {
            var loanModel = LoanTableData(
                wardNumber: e.wardNumber,
                agricultureLoan: e.agricultureLoan,
                houseExpLoan: e.houseExpLoan,
                businessLoan: e.businessLoan,
                foreignEmpLoan: e.foreignEmpLoan,
                educationLoan: e.educationLoan,
                medicalLoan: e.medicalLoan,
                othersLoan: e.othersLoan,
                notAvailable: e.notAvailable,
                wardHouses: e.wardHouses,
                totalLoan: e.totalLoan);
            await addLoanData(loanModel);
          }
          emit(LoanSuccessState(fetchedModel));
        } else {
          if (cacheData.isNotEmpty) {
            final cacheModel = cacheData.map((e) {
              return LoanModel(
                  wardNumber: e.wardNumber,
                  agricultureLoan: e.agricultureLoan,
                  houseExpLoan: e.houseExpLoan,
                  businessLoan: e.businessLoan,
                  foreignEmpLoan: e.foreignEmpLoan,
                  educationLoan: e.educationLoan,
                  medicalLoan: e.medicalLoan,
                  othersLoan: e.othersLoan,
                  notAvailable: e.notAvailable,
                  wardHouses: e.wardHouses,
                  totalLoan: e.totalLoan);
            }).toList();
            emit(LoanSuccessState(cacheModel));
            return;
          } else {
            emit(LoanFailureState(
                'No internet connection and no cached data available'));
          }
        }
      } catch (errMsg) {
        emit(LoanFailureState(errMsg.toString()));
      }
    });
  }
}
