import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:digital_profile/src/features/marriage/data/table_helper/marriage_table_helper.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../../../core/services/shared_preferences_service.dart';
import '../../data/database/marriage_database.dart';
import '../../data/model/marriage_status_model.dart';
import '../../domain/repository/marriage_status_repository.dart';

part 'marriage_status_event.dart';
part 'marriage_status_state.dart';

class MarriageStatusBloc
    extends Bloc<MarriageStatusEvent, MarriageStatusState> {
  String baseUrl, endPoints;
  MarriageRepository _marriageRepository;
  MarriageStatusBloc(this._marriageRepository, this.baseUrl, this.endPoints)
      : super(MarriageLoadingState()) {
    on<GetMarriageStatusEvent>((event, emit) async {
      try {
        final prefs = await PrefsService.getInstance();
        final gauPalika = prefs.getString(PrefsServiceKeys.villageName);
        final connectivityResults = await Connectivity().checkConnectivity();
        if (connectivityResults == ConnectivityResult.wifi ||
            connectivityResults == ConnectivityResult.mobile) {
          await clearMarriageData();
          List<MarriageStatusModel> fetchedModel =
              await _marriageRepository.getMarriageData(baseUrl, endPoints);
          for (var e in fetchedModel) {
            final marriageModel = MarriageTableData(
                villageName: gauPalika!,
                wardNumber: e.wardNumber,
                single: e.single,
                singleWoman: e.singleWoman,
                singleMan: e.singleMan,
                married: e.married,
                polygami: e.polygami,
                divorced: e.divorced,
                remarried: e.remarried,
                seperated: e.seperated,
                underage: e.underage,
                notAvailable: e.notAvailable,
                totalMaritalStatus: e.totalMaritalStatus);
            await addMarriage(marriageModel);
          }

          emit(MarriageSuccessState(marriageModel: fetchedModel));
        } else {
          final cacheData = await getAllMarriageData();
          final villageName = cacheData.map((e) => e.villageName).toSet();
          if (cacheData.isNotEmpty && villageName.contains(gauPalika)) {
            final cacheModel = cacheData.map((e) {
              return MarriageStatusModel(
                  wardNumber: e.wardNumber,
                  single: e.single,
                  singleWoman: e.singleWoman,
                  singleMan: e.singleMan,
                  married: e.married,
                  polygami: e.polygami,
                  divorced: e.divorced,
                  remarried: e.remarried,
                  seperated: e.seperated,
                  underage: e.underage,
                  notAvailable: e.notAvailable,
                  totalMaritalStatus: e.totalMaritalStatus);
            }).toList();
            emit(MarriageSuccessState(marriageModel: cacheModel));
          } else {
            emit(MarriageFailureState(
                errMsg:
                    'No internet connection and no cached data available.'));
          }
        }
      } catch (errMsg) {
        emit(MarriageFailureState(errMsg: errMsg.toString()));
      }
    });
  }
}
