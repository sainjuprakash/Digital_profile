import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../data/model/literacy_model.dart';
import '../../domain/repository/literacy_repository.dart';

part 'literacy_event.dart';
part 'literacy_state.dart';

class LiteracyBloc extends Bloc<LiteracyEvent, LiteracyState> {
  String baseUrl, endPoints;
  LiteracyRepository _literacyRepository;
  LiteracyBloc(this._literacyRepository, this.baseUrl, this.endPoints)
      : super(LiteracyLoadingState()) {
    on<LiteracyEvent>((event, emit) async {
      try {
        List<LiteracyModel> fetchedLiteracyData =
            await _literacyRepository.getLiteracyData(baseUrl, endPoints);
        emit(LiteracySuccessState(literacyModel: fetchedLiteracyData));
        print('literacy success state');
      } catch (errMsg) {
        emit(LiteracyFailureState(errMsg: errMsg.toString()));
      }
    });
  }
}
