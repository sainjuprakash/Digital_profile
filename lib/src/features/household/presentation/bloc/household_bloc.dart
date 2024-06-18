import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../data/model/family_details_model.dart';
import '../../domain/repository/household_repository.dart';

part 'household_event.dart';
part 'household_state.dart';

class HouseholdBloc extends Bloc<HouseholdEvent, HouseholdState> {
  HouseholdRepository householdRepository;
  String houseHoldUrl;
  HouseholdBloc(this.householdRepository,this.houseHoldUrl) : super(HouseholdLoadingState()) {
    on<GetHouseholdEvent>((event, emit) async {
      try {
        List<FamilyDetailsModel> fetchedModel =
            await householdRepository.getFamilyDetails(houseHoldUrl);
        emit(HouseholdSuccessState(fetchedModel));
      } catch (errMsg) {
        emit(HouseholdFailureState(errMsg.toString()));
      }
    });
  }
}
