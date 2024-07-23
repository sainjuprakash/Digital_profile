import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:digital_profile/src/features/table_no_115/data/table_helper/grant_house_table_helper.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../../../core/services/shared_preferences_service.dart';
import '../../data/database/grant_house_database.dart';
import '../../data/model/grant_house_model.dart';
import '../../domain/repository/grant_house_repository.dart';

part 'grant_house_event.dart';
part 'grant_house_state.dart';

class GrantHouseBloc extends Bloc<GrantHouseEvent, GrantHouseState> {
  GrantHouseRepository grantHouseRepository;
  String baseUrl, endPoint;
  GrantHouseBloc(
    this.grantHouseRepository,
    this.baseUrl,
    this.endPoint,
  ) : super(GrantHouseLoadingState()) {
    on<GetGrantHouseEvent>((event, emit) async {
      try {
        final prefs = await PrefsService.getInstance();
        final gauPalika = prefs.getString(PrefsServiceKeys.villageName);
        final connectivityResults = await Connectivity().checkConnectivity();
        if (connectivityResults == ConnectivityResult.wifi ||
            connectivityResults == ConnectivityResult.mobile) {
          await clearGrantHouseData();
          List<GrantHouseModel> fetchedModel =
              await grantHouseRepository.getGrantHousesData(baseUrl, endPoint);
          for (var e in fetchedModel) {
            var grantHouse = GrantHouseTableData(
              villageName : gauPalika!,
                wardNumber: e.wardNumber,
                hasBuild: e.hasBuild,
                hasNotBuild: e.hasNotBuild,
                notAvailable: e.notAvailable,
                total: e.total);
            await addGrantHouseDatabase(grantHouse);
          }
          emit(GrantHouseSuccessState(fetchedModel));
        } else {
          final cacheData = await getAllGrantHouseData();
          final villageName = cacheData.map((e) => e.villageName).toSet();
          if (cacheData.isNotEmpty && villageName.contains(gauPalika)) {
            final cacheModel = cacheData.map((e) {
              return GrantHouseModel(
                  wardNumber: e.wardNumber,
                  hasBuild: e.hasBuild,
                  hasNotBuild: e.hasNotBuild,
                  notAvailable: e.notAvailable,
                  total: e.total);
            }).toList();
            emit(GrantHouseSuccessState(cacheModel));
            return;
          } else {
            emit(GrantHouseFailureState(
                'No internet connection and no cached data available'));
          }
        }
      } catch (errMsg) {
        emit(GrantHouseFailureState(errMsg.toString()));
      }
    });
  }
}
