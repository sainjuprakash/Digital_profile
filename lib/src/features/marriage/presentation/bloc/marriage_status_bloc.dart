import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../data/model/marriage_status_model.dart';
import '../../domain/repository/marriage_status_repository.dart';

part 'marriage_status_event.dart';
part 'marriage_status_state.dart';

class MarriageStatusBloc
    extends Bloc<MarriageStatusEvent, MarriageStatusState> {
  MarriageRepository _marriageRepository;
  MarriageStatusBloc(this._marriageRepository) : super(MarriageLoadingState()) {
    on<GetMarriageStatusEvent>((event, emit) async {
      try {
        List<MarriageStatusModel> fetchedModel =
            await _marriageRepository.getMarriageData();
        emit(MarriageSuccessState(marriageModel: fetchedModel));
      } catch (errMsg) {
        emit(MarriageFailureState(errMsg: errMsg.toString()));
      }
    });
  }
}
