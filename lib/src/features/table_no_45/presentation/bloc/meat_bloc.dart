import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:digital_profile/src/features/table_no_45/data/table_helper/meat_table_helper.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../../../core/services/shared_preferences_service.dart';
import '../../data/database/meat_database.dart';
import '../../data/model/meat_model.dart';
import '../../domain/repository/meat_repository.dart';

part 'meat_event.dart';
part 'meat_state.dart';

class MeatBloc extends Bloc<MeatEvent, MeatState> {
  final MeatRepository meatRepository;
  final String baseUrl;
  final String endPoint;

  MeatBloc(this.meatRepository, this.baseUrl, this.endPoint)
      : super(MeatLoadingState()) {
    on<MeatEvent>((event, emit) async {
      try {
        final prefs = await PrefsService.getInstance();
        final gauPalika = prefs.getString(PrefsServiceKeys.villageName);
        final connectivityResults = await Connectivity().checkConnectivity();
        if (connectivityResults == ConnectivityResult.wifi) {
          List<MeatModel> fetchedModel =
              await meatRepository.getMeatData(baseUrl, endPoint);
          await clearMeatDatabase();
          for (var e in fetchedModel) {
            final meatModel = MeatTableData(
              villageName: gauPalika!,
              wardNumber: e.wardNumber,
              animalsQuantity: e.animalsQuantity,
              meatKg: e.meatKg,
              meatEarning: e.meatEarning,
              houseCount: e.houseCount,
            );
            await addMeatData(meatModel);
          }

          emit(MeatSuccessState(fetchedModel));
        } else {
          final cacheData = await getAllMeatData();
          final villageName = cacheData.map((e) => e.villageName).toSet();
          if (cacheData.isNotEmpty && villageName.contains(gauPalika)) {
            final localModel = cacheData.map((e) {
              return MeatModel(
                wardNumber: e.wardNumber,
                animalsQuantity: e.animalsQuantity,
                meatKg: e.meatKg,
                meatEarning: e.meatEarning,
                houseCount: e.houseCount,
              );
            }).toList();
            emit(MeatSuccessState(localModel));
          } else {
            emit(MeatFailureState(
                'No internet connection and no cached data available'));
          }
        }
      } catch (errMsg) {
        emit(MeatFailureState(errMsg.toString()));
      }
    });
  }
}
