import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../data/models/ethnicity_model.dart';
import '../../domain/repository/ethnicity_repository.dart';

part 'ethnicity_event.dart';
part 'ethnicity_state.dart';

class EthnicityBloc extends Bloc<EthnicityEvent, EthnicityState> {
  final EthnicityRepository _ethnicityRepository;
  EthnicityBloc(this._ethnicityRepository) : super(EthnicityLoadingState()) {
    on<LoadEthnicityEvent>((event, emit) async {
      //print("before try statement");
      try {
        List<EthnicityModel> ethnicityModel =
            await _ethnicityRepository.getEthnicityData();
        emit(EthnicitySuccessState(fetchedEthnicityModel: ethnicityModel));
       // print('success state emitted');
      } catch (errormsg) {
        print(errormsg.toString());
        emit(EthnicityFailureState(errmsg: errormsg.toString()));
      }
    });
  }
}
