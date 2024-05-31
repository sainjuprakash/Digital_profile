import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../data/model/house_ownership_model.dart';
import '../../domain/repositiry/house_ownership_repository.dart';

part 'house_ownership_event.dart';
part 'house_ownership_state.dart';

class HouseOwnershipBloc
    extends Bloc<HouseOwnershipEvent, HouseOwnershipState> {
  HouseOwnershipRepository houseOwnershipRepository;
  String baseUrl, endPoint;
  HouseOwnershipBloc(this.houseOwnershipRepository, this.baseUrl, this.endPoint)
      : super(HouseOwnershipLoadingState()) {
    on<GetHouseOwnershipEvent>((event, emit) async {
      try {
        List<HouseOwnershipModel> fetchedData = await houseOwnershipRepository
            .getHouseOwnershipData(baseUrl, endPoint);
        emit(HouseOwnershipSuccessState(fetchedData));
      } catch (errMsg) {
        emit(HouseOwnershipFailureState(errMsg.toString()));
      }
    });
  }
}
