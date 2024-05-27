part of 'house_bloc.dart';

@immutable
abstract class HouseState extends Equatable {
  @override
  List<Object?> get props => [];
}

class HouseLoadingState extends HouseState {}

class HouseSuccessState extends HouseState {
  List<HouseConditionModel> houseModel;
  HouseSuccessState(this.houseModel);
}

class HouseFailureState extends HouseState {
  String errMsg;
  HouseFailureState(this.errMsg);
}
