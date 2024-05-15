import 'package:bloc/bloc.dart';
import 'package:digital_profile/src/features/ethnicity_population/data/model/ethnicity_population_model.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../domain/repository/ethnicity_population_repository.dart';

part 'ethnicity_population_event.dart';
part 'ethnicity_population_state.dart';

class EthnicityPopulationBloc
    extends Bloc<EthnicityPopulationEvent, EthnicityPopulationState> {
  final EthnicityPopulationRepository _ethnicityPopulationRepository;
  EthnicityPopulationBloc(this._ethnicityPopulationRepository)
      : super(EthnicityPopulationLoadingState()) {
    on<GetEthnicityPopulationEvent>((event, emit) async {
      try {
        List<EthnicityPopulationModel> ethnicityPopulationModel =
            await _ethnicityPopulationRepository.getEthnicityPopulation();
        print(ethnicityPopulationModel);
        emit(EthnicityPopulationSuccessState(
            ethnicityPopulationModel: ethnicityPopulationModel));
      } catch (errMsg) {
        print(errMsg);
        emit(EthnicityPopulationFailureState(errMsg: errMsg.toString()));
      }
    });
  }
}
