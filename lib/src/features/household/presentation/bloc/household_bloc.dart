import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:digital_profile/src/features/household/data/database/household_database.dart';
import 'package:digital_profile/src/features/household/data/table_helper/household_table_helper.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../data/model/family_details_model.dart';
import '../../domain/repository/household_repository.dart';

part 'household_event.dart';
part 'household_state.dart';

class HouseholdBloc extends Bloc<HouseholdEvent, HouseholdState> {
  HouseholdRepository householdRepository;
  String houseHoldUrl;
  HouseholdBloc(this.householdRepository, this.houseHoldUrl)
      : super(HouseholdLoadingState()) {
    on<GetHouseholdEvent>((event, emit) async {
      try {
        final cacheData = await getAllHouseholdData();
        if (cacheData.isNotEmpty) {
          final cacheModel = cacheData.map((e) {
            return FamilyDetailsModel(
                id: e.id,
                houseNumber: e.houseNumber,
                wardNo: e.wardNo,
                setName: e.setName,
                road: e.road,
                roadToHouse: e.roadToHouse,
                respondent: e.respondent,
                phoneNumber: e.phoneNumber,
                relationHh: e.relationHh,
                migrationType: e.migrationType,
                familyCount: e.familyCount,
                isDeath: e.isDeath,
                deathQty: e.deathQty,
                latitude: e.latitude,
                longitude: e.longitude,
                individualData: e.individualData);
          }).toList();
          emit(HouseholdSuccessState(cacheModel));
          return;
        }
        final connectivityResults = await Connectivity().checkConnectivity();
        if (connectivityResults == ConnectivityResult.wifi ||
            connectivityResults == ConnectivityResult.mobile) {
          List<FamilyDetailsModel> fetchedModel =
              await householdRepository.getFamilyDetails(houseHoldUrl);
          for (var e in fetchedModel) {
            var fetchedHhModel = HouseholdTableData(
                id: e.id,
                houseNumber: e.houseNumber,
                wardNo: e.wardNo,
                setName: e.setName,
                road: e.road,
                roadToHouse: e.roadToHouse,
                respondent: e.respondent,
                phoneNumber: e.phoneNumber,
                relationHh: e.relationHh,
                migrationType: e.migrationType,
                familyCount: e.familyCount,
                isDeath: e.isDeath,
                deathQty: e.deathQty,
                latitude: e.latitude,
                longitude: e.longitude,
                individualData: e.individualData);
            await addHousehold(fetchedHhModel);
          }
          emit(HouseholdSuccessState(fetchedModel));
        } else {
          if (cacheData.isNotEmpty) {
            final cacheModel = cacheData.map((e) {
              return FamilyDetailsModel(
                  id: e.id,
                  houseNumber: e.houseNumber,
                  wardNo: e.wardNo,
                  setName: e.setName,
                  road: e.road,
                  roadToHouse: e.roadToHouse,
                  respondent: e.respondent,
                  phoneNumber: e.phoneNumber,
                  relationHh: e.relationHh,
                  migrationType: e.migrationType,
                  familyCount: e.familyCount,
                  isDeath: e.isDeath,
                  deathQty: e.deathQty,
                  latitude: e.latitude,
                  longitude: e.longitude,
                  individualData: e.individualData);
            }).toList();
            emit(HouseholdSuccessState(cacheModel));
          } else {
            emit(HouseholdFailureState(
                'No internet connection and no cached data available.'));
          }
        }
      } catch (errMsg) {
        emit(HouseholdFailureState(errMsg.toString()));
      }
    });
  }
}
