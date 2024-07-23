import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:digital_profile/src/features/table_no_100/data/table_helper/child_worker_table-helper.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../../../core/services/shared_preferences_service.dart';
import '../../data/database/child_worker_database.dart';
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
        final prefs = await PrefsService.getInstance();
        final gauPalika = prefs.getString(PrefsServiceKeys.villageName);
        final connectivityResults = await Connectivity().checkConnectivity();
        if (connectivityResults == ConnectivityResult.wifi ||
            connectivityResults == ConnectivityResult.mobile) {
          await clearChildData();
          List<ChildWorkerModel> fetchedModel =
              await childWorkerRepository.getChildData(baseUrl, endPoint);
          for (var e in fetchedModel) {
            var childData = ChildWorkerTableData(
                villageName: gauPalika!,
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
          final cacheData = await getAllChildData();
          final villageName = cacheData.map((e) => e.villageName).toSet();
          if (cacheData.isNotEmpty && villageName.contains(gauPalika)) {
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
