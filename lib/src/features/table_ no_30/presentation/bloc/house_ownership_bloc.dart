import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:digital_profile/src/features/table_%20no_30/data/table_helper/house_ownership_table_helper.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../../../core/services/shared_preferences_service.dart';
import '../../data/database/house_ownership_database.dart';
import '../../data/model/house_ownership_model.dart';
import '../../domain/repositiry/house_ownership_repository.dart';

part 'house_ownership_event.dart';
part 'house_ownership_state.dart';

class HouseOwnershipBloc
    extends Bloc<HouseOwnershipEvent, HouseOwnershipState> {
  HouseOwnershipRepository houseOwnershipRepository;
  String baseUrl, endPoint;
  HouseOwnershipBloc(this.houseOwnershipRepository, this.baseUrl, this.endPoint)
      : super(HouseOwnershipLoadingState()) {
    on<GetHouseOwnershipEvent>((event, emit) async {
      try {
        final prefs = await PrefsService.getInstance();
        final gauPalika = prefs.getString(PrefsServiceKeys.villageName);
        final connectivityResults = await Connectivity().checkConnectivity();
        if (connectivityResults == ConnectivityResult.wifi ||
            connectivityResults == ConnectivityResult.mobile) {
          await clearHouseOwnershipData();
          List<HouseOwnershipModel> fetchedData = await houseOwnershipRepository
              .getHouseOwnershipData(baseUrl, endPoint);
          for (var e in fetchedData) {
            var ownershipData = OwnershipTableData(
                wardNumber: e.wardNumber,
                personal: e.personal,
                rental: e.rental,
                organizational: e.organizational,
                sukumbasi: e.sukumbasi,
                others: e.others,
                notAvailable: e.notAvailable,
                total: e.total,
                villageName: gauPalika!);
            await addHouseOwnershipData(ownershipData);
          }
          emit(HouseOwnershipSuccessState(fetchedData));
        } else {
          final cacheData = await getAllHouseOwnershipData();
          final villageName = cacheData.map((e) => e.villageName).toSet();
          if (cacheData.isNotEmpty && villageName.contains(gauPalika)) {
            final cacheModel = cacheData.map((e) {
              return HouseOwnershipModel(
                  wardNumber: e.wardNumber,
                  personal: e.personal,
                  rental: e.rental,
                  organizational: e.organizational,
                  sukumbasi: e.sukumbasi,
                  others: e.others,
                  notAvailable: e.notAvailable,
                  total: e.total);
            }).toList();
            emit(HouseOwnershipSuccessState(cacheModel));
            return;
          } else {
            emit(HouseOwnershipFailureState(
                'No internet connection and no cached data available'));
          }
        }
      } catch (errMsg) {
        emit(HouseOwnershipFailureState(errMsg.toString()));
      }
    });
  }
}
