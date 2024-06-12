import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../data/model/grant_stage_model.dart';
import '../../domain/repository/grant_stage_repository.dart';

part 'grant_stage_event.dart';
part 'grant_stage_state.dart';

class GrantStageBloc extends Bloc<GrantStageEvent, GrantStageState> {
  GrantStageRepository grantStageRepository;
  String baseUrl, endPoint;
  GrantStageBloc(this.grantStageRepository, this.baseUrl, this.endPoint)
      : super(GrantStageLoadingState()) {
    on<GetGrantStageEvent>((event, emit) async {
      try {
        List<GrantStageModel> fetchedModel =
            await grantStageRepository.getGrantData(baseUrl, endPoint);
        emit(GrantStageSuccessState(fetchedModel));
      } catch (errMsg) {
        emit(GrantStageFailureState(errMsg.toString()));
      }
    });
  }
}
