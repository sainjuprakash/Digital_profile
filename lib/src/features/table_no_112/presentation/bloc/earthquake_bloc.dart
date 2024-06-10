import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'earthquake_event.dart';
part 'earthquake_state.dart';

class EarthquakeBloc extends Bloc<EarthquakeEvent, EarthquakeState> {
  EarthquakeBloc() : super(EarthquakeInitial()) {
    on<EarthquakeEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
