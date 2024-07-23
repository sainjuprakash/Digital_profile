import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:digital_profile/src/features/toilet/data/database/toilet_database.dart';
import 'package:digital_profile/src/features/toilet/data/table_helper/toilet_table_helper.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../../../core/services/shared_preferences_service.dart';
import '../../data/model/toilet_model.dart';
import '../../domain/repository/toilet_repository.dart';

part 'toilet_event.dart';
part 'toilet_state.dart';

class ToiletBloc extends Bloc<ToiletEvent, ToiletState> {
  String baseUrl, endPoint;
  ToiletRepository _toiletRepository;
  ToiletBloc(this._toiletRepository, this.baseUrl, this.endPoint)
      : super(ToiletLoadingState()) {
    on<ToiletEvent>((event, emit) async {
      try {
        final prefs = await PrefsService.getInstance();
        final gauPalika = prefs.getString(PrefsServiceKeys.villageName);
        final connectivityResults = await Connectivity().checkConnectivity();
        if (connectivityResults == ConnectivityResult.wifi ||
            connectivityResults == ConnectivityResult.mobile) {
          await clearToiletData();
          List<ToiletModel> fetchedToiletModel =
              await _toiletRepository.getToiletData(baseUrl, endPoint);
          for (var e in fetchedToiletModel) {
            var toiletData = ToiletTableData(
                villageName: gauPalika!,
                wardNumber: e.wardNumber,
                noToilet: e.noToilet,
                publicDhal: e.publicDhal,
                seftiTank: e.seftiTank,
                ordinary: e.ordinary,
                notAvailable: e.notAvailable,
                totalToilet: e.totalToilet);
            await addToiletData(toiletData);
          }
          emit(ToiletSuccessState(toiletModel: fetchedToiletModel));
        } else {
          final cacheData = await getAllToiletData();
          final villageName = cacheData.map((e) => e.villageName).toSet();
          if (cacheData.isNotEmpty && villageName.contains(gauPalika)) {
            final cacheModel = cacheData.map((e) {
              return ToiletModel(
                  wardNumber: e.wardNumber,
                  noToilet: e.noToilet,
                  publicDhal: e.publicDhal,
                  seftiTank: e.seftiTank,
                  ordinary: e.ordinary,
                  notAvailable: e.notAvailable,
                  totalToilet: e.totalToilet);
            }).toList();
            emit(ToiletSuccessState(toiletModel: cacheModel));
          } else {
            emit(ToiletFailureState(
                errMsg:
                    'No internet connection and no cached data available.'));
          }
        }
      } catch (errMsg) {
        emit(ToiletFailureState(errMsg: errMsg.toString()));
      }
    });
  }
}
