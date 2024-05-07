import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../data/models/language_model.dart';
import '../../domain/repository/language_repository.dart';

part 'language_event.dart';
part 'language_state.dart';

class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  final LanguageRepository _languageRepository;
  LanguageBloc(this._languageRepository) : super(LanguageLoadingState()) {
    on<LoadLanguageEvent>((event, emit) async {
     // print("before try statement");
      try {
        //print("entered try statement");
        List<LanguageModel> fetchedLanguageData =
            await _languageRepository.getLanguageData();
     // print('data fetched ');
        emit(LanguageLoadedState(fetchedLanguageModel: fetchedLanguageData));
      } catch (errMsg) {
        emit(LanguageFailureState(errmsg: errMsg.toString()));
      }
    });
  }
}
