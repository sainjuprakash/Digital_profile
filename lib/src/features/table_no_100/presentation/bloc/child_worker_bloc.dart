import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../data/model/child_worker_model.dart';
import '../../domain/repository/child_worker_repository.dart';

part 'child_worker_event.dart';
part 'child_worker_state.dart';

class ChildWorkerBloc extends Bloc<ChildWorkerEvent, ChildWorkerState> {
  ChildWorkerRepository childWorkerRepository;
  String baseUrl, endPoint;
  ChildWorkerBloc(this.childWorkerRepository, this.baseUrl, this.endPoint)
      : super(ChildWorkerLoadingState()) {
    on<GetChildWorkerEvent>((event, emit) async {
      try {
        List<ChildWorkerModel> fetchedModel =
            await childWorkerRepository.getChildData(baseUrl, endPoint);
        emit(ChildWorkerSuccessState(fetchedModel));
      } catch (errMsg) {
        emit(ChildWorkerFailureState(errMsg.toString()));
      }
    });
  }
}
