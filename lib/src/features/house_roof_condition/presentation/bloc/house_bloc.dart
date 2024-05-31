import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../data/model/house_condition_model.dart';
import '../../domain/repository/house_condition_repository.dart';

part 'house_event.dart';
part 'house_state.dart';

class HouseBloc extends Bloc<HouseEvent, HouseState> {
  String baseUrl, endPoint;
  HouseRoofConditionRepository _houseConditionRepository;
  HouseBloc(this._houseConditionRepository, this.baseUrl, this.endPoint)
      : super(HouseLoadingState()) {
    on<GetHouseEvent>((event, emit) async {
      try {
        List<HouseConditionModel> fetchedModel =
            await _houseConditionRepository.getHomeData(baseUrl, endPoint);
        emit(HouseSuccessState(fetchedModel));
      } catch (errMsg) {
        emit(HouseFailureState(errMsg.toString()));
      }
    });
  }
}
