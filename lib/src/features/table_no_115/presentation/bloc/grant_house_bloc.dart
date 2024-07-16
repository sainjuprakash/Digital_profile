import 'package:bloc/bloc.dart';
import 'package:digital_profile/src/features/table_no_115/data/table_helper/grant_house_table_helper.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../data/model/grant_house_model.dart';
import '../../domain/repository/grant_house_repository.dart';

part 'grant_house_event.dart';
part 'grant_house_state.dart';

class GrantHouseBloc extends Bloc<GrantHouseEvent, GrantHouseState> {
  GrantHouseRepository grantHouseRepository;
  String baseUrl, endPoint;
  GrantHouseBloc(
    this.grantHouseRepository,
    this.baseUrl,
    this.endPoint,
  ) : super(GrantHouseLoadingState()) {
    on<GetGrantHouseEvent>((event, emit) async {
      try {
        final cacheData = await getAllHouseGrantData();
        if (cacheData.isNotEmpty) {
          final cacheMoedel = cacheData.map((e) {
            return GrantHouseModel(
                wardNumber: e.wardNumber,
                hasBuild: e.hasBuild,
                hasNotBuild: e.hasNotBuild,
                notAvailable: e.notAvailable,
                total: e.total);
          }).toList();
          emit(GrantHouseSuccessState(cacheMoedel));
          return;
        }
        List<GrantHouseModel> fetchedModel =
            await grantHouseRepository.getGrantHousesData(baseUrl, endPoint);
        emit(GrantHouseSuccessState(fetchedModel));
      } catch (errMsg) {
        emit(GrantHouseFailureState(errMsg.toString()));
      }
    });
  }
}
