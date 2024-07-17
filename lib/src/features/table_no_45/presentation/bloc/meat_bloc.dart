import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:digital_profile/src/features/table_no_45/data/database/meat_database.dart';
import 'package:digital_profile/src/features/table_no_45/data/table_helper/meat_table_helper.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

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
        final connectivityResults = await Connectivity().checkConnectivity();

        if (connectivityResults == ConnectivityResult.wifi) {
          // Fetch data from the API
          List<MeatModel> fetchedModel =
              await meatRepository.getMeatData(baseUrl, endPoint);

          // Clear existing local data and insert fetched data
          await clearMeatDatabase();
          for (var e in fetchedModel) {
            final meatModel = MeatTableData(
              wardNumber: e.wardNumber,
              animalsQuantity: e.animalsQuantity,
              meatKg: e.meatKg,
              meatEarning: e.meatEarning,
              houseCount: e.houseCount,
            );
            await addMeatData(meatModel);
          }

          // Emit the fetched data
          emit(MeatSuccessState(fetchedModel));
        } else {
          // Load data from the local database
          final localData = await getAllMeatData();

          if (localData.isNotEmpty) {
            final localModel = localData.map((e) {
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
