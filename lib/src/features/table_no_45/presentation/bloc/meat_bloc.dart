import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../data/model/meat_model.dart';
import '../../domain/repository/meat_repository.dart';

part 'meat_event.dart';
part 'meat_state.dart';

class MeatBloc extends Bloc<MeatEvent, MeatState> {
  MeatRepository meatRepository;
  String baseUrl, endPoint;
  MeatBloc(this.meatRepository, this.baseUrl, this.endPoint)
      : super(MeatLoadingState()) {
    on<MeatEvent>((event, emit) async {
      try {
        List<MeatModel> fetchedModel =
            await meatRepository.getMeatData(baseUrl, endPoint);
        emit(MeatSuccessState(fetchedModel));
      } catch (errMsg) {
        emit(MeatFailureState(errMsg.toString()));
      }
    });
  }
}
