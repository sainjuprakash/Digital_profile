import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../data/model/toilet_model.dart';
import '../../domain/repository/toilet_repository.dart';

part 'toilet_event.dart';
part 'toilet_state.dart';

class ToiletBloc extends Bloc<ToiletEvent, ToiletState> {
  ToiletRepository _toiletRepository;
  ToiletBloc(this._toiletRepository) : super(ToiletLoadingState()) {
    on<ToiletEvent>((event, emit) async {
      try {
        List<ToiletModel> fetchedToiletModel =
            await _toiletRepository.getToiletData();
        emit(ToiletSuccessState(toiletModel: fetchedToiletModel));
      } catch (errMsg) {
        emit(ToiletFailureState(errMsg: errMsg.toString()));
      }
    });
  }
}
