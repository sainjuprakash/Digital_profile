import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'child_worker_event.dart';
part 'child_worker_state.dart';

class ChildWorkerBloc extends Bloc<ChildWorkerEvent, ChildWorkerState> {
  ChildWorkerBloc() : super(ChildWorkerInitial()) {
    on<ChildWorkerEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
