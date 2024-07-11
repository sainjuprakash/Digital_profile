import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:digital_profile/src/features/table_no_100/data/database/child_worker_database.dart';
import 'package:digital_profile/src/features/table_no_100/data/table_helper/child_worker_table-helper.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../data/model/child_worker_model.dart';
import '../../domain/repository/child_worker_repository.dart';

part 'child_worker_event.dart';
part 'child_worker_state.dart';

class ChildWorkerBloc extends Bloc<ChildWorkerEvent, ChildWorkerState> {
  ChildWorkerRepository childWorkerRepository;
  String baseUrl, endPoint;
  ChildWorkerBloc(this.childWorkerRepository, this.baseUrl, this.endPoint)
      : super(ChildWorkerLoadingState()) {
    on<GetChildWorkerEvent>((event, emit) async {
      try {
        final cacheData = await getAllChildData();
        if (cacheData.isNotEmpty) {
          final cacheModel = cacheData.map((e) {
            return ChildWorkerModel(
                wardNumber: e.wardNumber,
                yes: e.yes,
                no: e.no,
                notAvailable: e.notAvailable,
                wardHouses: e.wardHouses,
                totalUnderSixteen: e.totalUnderSixteen);
          }).toList();
          emit(ChildWorkerSuccessState(cacheModel));
          return;
        }
        final connectivityResults = await Connectivity().checkConnectivity();
        if (connectivityResults == ConnectivityResult.wifi ||
            connectivityResults == ConnectivityResult.mobile) {
          List<ChildWorkerModel> fetchedModel =
              await childWorkerRepository.getChildData(baseUrl, endPoint);
          for (var e in fetchedModel) {
            var childData = ChildWorkerTableData(
                wardNumber: e.wardNumber,
                yes: e.yes,
                no: e.no,
                notAvailable: e.notAvailable,
                wardHouses: e.wardHouses,
                totalUnderSixteen: e.totalUnderSixteen);
            await addChildData(childData);
          }
          emit(ChildWorkerSuccessState(fetchedModel));
        } else {
          if (cacheData.isNotEmpty) {
            final cacheModel = cacheData.map((e) {
              return ChildWorkerModel(
                  wardNumber: e.wardNumber,
                  yes: e.yes,
                  no: e.no,
                  notAvailable: e.notAvailable,
                  wardHouses: e.wardHouses,
                  totalUnderSixteen: e.totalUnderSixteen);
            }).toList();
            emit(ChildWorkerSuccessState(cacheModel));
            return;
          } else {
            emit(ChildWorkerFailureState(
                'No internet connection and no cached data available'));
          }
        }
      } catch (errMsg) {
        emit(ChildWorkerFailureState(errMsg.toString()));
      }
    });
  }
}
