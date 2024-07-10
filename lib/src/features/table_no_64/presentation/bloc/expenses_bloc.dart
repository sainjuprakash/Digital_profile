import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:digital_profile/src/features/table_no_64/data/database/expenses_database.dart';
import 'package:digital_profile/src/features/table_no_64/data/table_helper/expenses_table_helper.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../data/model/expenses_model.dart';
import '../../domain/repository/expenses_repository.dart';

part 'expenses_event.dart';
part 'expenses_state.dart';

class ExpensesBloc extends Bloc<ExpensesEvent, ExpensesState> {
  ExpensesRepository expensesRepository;
  String baseUrl, endPoint;
  ExpensesBloc(this.expensesRepository, this.baseUrl, this.endPoint)
      : super(ExpensesLoadingState()) {
    on<GetExpensesEvent>((event, emit) async {
      try {
        final cacheData = await getAllExpensesData();
        if (cacheData.isNotEmpty) {
          final cacheModel = cacheData.map((e) {
            return ExpensesModel(
                wardNumber: e.wardNumber,
                clothes: e.clothes,
                education: e.education,
                health: e.health,
                festival: e.festival,
                agriculture: e.agriculture,
                others: e.others,
                totalExpenses: e.totalExpenses);
          }).toList();
          emit(ExpensesSuccessState(cacheModel));
          return;
        }
        final connectivityResults = await Connectivity().checkConnectivity();
        if (connectivityResults == ConnectivityResult.wifi ||
            connectivityResults == ConnectivityResult.mobile) {
          List<ExpensesModel> fetchedModel =
              await expensesRepository.getExpensesData(baseUrl, endPoint);
          for (var e in fetchedModel) {
            final expensesModel = ExpensesTableData(
                wardNumber: e.wardNumber,
                clothes: e.clothes,
                education: e.education,
                health: e.health,
                festival: e.festival,
                agriculture: e.agriculture,
                others: e.others,
                totalExpenses: e.totalExpenses);
            await addExpensesData(expensesModel);
          }
          emit(ExpensesSuccessState(fetchedModel));
        } else {
          if (cacheData.isNotEmpty) {
            var cacheModel = cacheData.map((e) {
              return ExpensesModel(
                  wardNumber: e.wardNumber,
                  clothes: e.clothes,
                  education: e.education,
                  health: e.health,
                  festival: e.festival,
                  agriculture: e.agriculture,
                  others: e.others,
                  totalExpenses: e.totalExpenses);
            }).toList();
            emit(ExpensesSuccessState(cacheModel));
            return;
          } else {
            emit(ExpensesFailureState(
                'No internet connection and no cached data available'));
          }
        }
      } catch (errMsg) {
        emit(ExpensesFailureState(errMsg.toString()));
      }
    });
  }
}
