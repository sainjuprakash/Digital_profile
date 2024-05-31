import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../data/model/home_facilities_model.dart';
import '../../domain/repository/home_facilities_repository.dart';

part 'home_facilities_event.dart';
part 'home_facilities_state.dart';

class HomeFacilitiesBloc
    extends Bloc<HomeFacilitiesEvent, HomeFacilitiesState> {
  String baseUrl, endPoint;
  HomeFacilitiesRepository _homeFacilitiesRepository;
  HomeFacilitiesBloc(
      this._homeFacilitiesRepository, this.baseUrl, this.endPoint)
      : super(HomeFacilitiesLoadingState()) {
    on<HomeFacilitiesEvent>((event, emit) async {
      try {
        List<HomeFacilitiesModel> fetchedModel = await _homeFacilitiesRepository
            .getHomeFacilities(baseUrl, endPoint);
        emit(HomeFacilitiesSuccessState(fetchedModel));
      } catch (errMsg) {
        emit(HomeFacilitiesFailureState(errMsg.toString()));
      }
    });
  }
}
