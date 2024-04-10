import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'data_event.dart';
part 'data_state.dart';

class DataBloc extends Bloc<DataEvent, DataState> {
  DataBloc() : super(DataLoadingState()) {
    on<DataEvent>((event, emit) async {
      emit(DataLoadingState());
    });
  }
}
