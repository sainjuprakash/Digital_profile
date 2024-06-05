import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../data/model/settlement_model.dart';
import '../../domain/repository/settlement_repository.dart';

part 'settlement_event.dart';
part 'settlement_state.dart';

class SettlementBloc extends Bloc<SettlementEvent, SettlementState> {
  SettlementRepository settlementRepository;
  String baseUrl, endPoint;
  SettlementBloc(this.settlementRepository, this.baseUrl, this.endPoint)
      : super(SettlementLoadingState()) {
    on<GetSettlementEvent>((event, emit) async {
      try {
        List<SettlementModel> fetchedModel =
            await settlementRepository.getSettlementData(baseUrl, endPoint);
        emit(SettlementSuccessState(fetchedModel));
      } catch (errMsg) {
        emit(SettlementFailureState(errMsg.toString()));
      }
    });
  }
}
