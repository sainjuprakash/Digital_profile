import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'marriage_status_event.dart';
part 'marriage_status_state.dart';

class MarriageStatusBloc extends Bloc<MarriageStatusEvent, MarriageStatusState> {
  MarriageStatusBloc() : super(MarriageStatusInitial()) {
    on<MarriageStatusEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
