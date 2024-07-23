import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:digital_profile/src/features/table_no_97/data/table_helper/road_distance_table_helper.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../../../core/services/shared_preferences_service.dart';
import '../../data/database/road_distance_database.dart';
import '../../data/model/road_distance_model.dart';
import '../../domain/repository/road_distance_repository.dart';

part 'road_distance_event.dart';
part 'road_distance_state.dart';

class RoadDistanceBloc extends Bloc<RoadDistanceEvent, RoadDistanceState> {
  RoadDistanceRepository roadDistanceRepository;
  String baseUrl, endPoint;
  RoadDistanceBloc(this.roadDistanceRepository, this.baseUrl, this.endPoint)
      : super(RoadDistanceLoadingState()) {
    on<GetRoadDistanceEvent>((event, emit) async {
      try {
        final prefs = await PrefsService.getInstance();
        final gauPalika = prefs.getString(PrefsServiceKeys.villageName);
        final connectivityResults = await Connectivity().checkConnectivity();
        if (connectivityResults == ConnectivityResult.wifi ||
            connectivityResults == ConnectivityResult.mobile) {
          await clearRoadDistanceData();
          List<RoadDistanceModel> fetchedModel =
              await roadDistanceRepository.getRoadData(baseUrl, endPoint);
          for (var e in fetchedModel) {
            var roadModel = RoadDistanceTableData(
                villageName: gauPalika!,
                wardNumber: e.wardNumber,
                lessThanOneHours: e.lessThanOneHours,
                twoHours: e.twoHours,
                upToFiveHours: e.upToFiveHours,
                moreThanFive: e.moreThanFive,
                total: e.total);
            await addRoadHouseData(roadModel);
          }
          emit(RoadDistanceSuccessState(fetchedModel));
        } else {
          final cacheData = await getAllRoadDistanceData();
          final villageName = cacheData.map((e) => e.villageName).toSet();
          if (cacheData.isNotEmpty && villageName.contains(gauPalika)) {
            final cacheModel = cacheData.map((e) {
              return RoadDistanceModel(
                  wardNumber: e.wardNumber,
                  lessThanOneHours: e.lessThanOneHours,
                  twoHours: e.twoHours,
                  upToFiveHours: e.upToFiveHours,
                  moreThanFive: e.moreThanFive,
                  total: e.total);
            }).toList();
            emit(RoadDistanceSuccessState(cacheModel));
            return;
          } else {
            emit(RoadDistanceFailureState(
                'No internet connection and no cached data available'));
          }
        }
      } catch (errMsg) {
        emit(RoadDistanceFailureState(errMsg.toString()));
      }
    });
  }
}
