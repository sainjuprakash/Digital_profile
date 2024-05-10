import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'religion_event.dart';
part 'religion_state.dart';

class ReligionBloc extends Bloc<ReligionEvent, ReligionState> {
  ReligionBloc() : super(ReligionInitial()) {
    on<ReligionEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
