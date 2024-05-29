import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../data/model/religion_model.dart';
import '../../domain/repository/religion_repository.dart';

part 'religion_event.dart';
part 'religion_state.dart';

class ReligionBloc extends Bloc<ReligionEvent, ReligionState> {
  String baseUrl,endPoint;
  final ReligionRepository _religionRepository;
  ReligionBloc(this._religionRepository,this.baseUrl,this.endPoint) : super(ReligionLoadingState()) {
    on<GetReligionEvent>((event, emit) async {
      try {
        List<ReligionModel> religionModel =
            await _religionRepository.getReligionData(baseUrl,endPoint);
        emit(ReligionSuccessState(religionModel: religionModel));
      } catch (errMsg) {
        emit(ReligionFailureState(errMsg: errMsg.toString()));
      }
    });
  }
}
