import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../data/model/insurance_model.dart';
import '../../domain/repository/insurance_repository.dart';

part 'insurance_event.dart';
part 'insurance_state.dart';

class InsuranceBloc extends Bloc<InsuranceEvent, InsuranceState> {
  String baseUrl, endPoint;
  InsuranceRepository _insuranceRepository;
  InsuranceBloc(this._insuranceRepository, this.baseUrl, this.endPoint)
      : super(InsuranceLoadingState()) {
    on<GetInsuranceEvent>((event, emit) async {
      try {
        List<InsuranceModel> fetchedInsModel =
            await _insuranceRepository.getInsuranceData(baseUrl, endPoint);
        emit(InsuranceSuccessState(insuranceModel: fetchedInsModel));
      } catch (errMsg) {
        emit(InsuranceFailureState(errMsg: errMsg.toString()));
      }
    });
  }
}
