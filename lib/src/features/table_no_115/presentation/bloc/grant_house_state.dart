part of 'grant_house_bloc.dart';

@immutable
abstract class GrantHouseState extends Equatable {
  @override
  List<Object?> get props => [];
}

class GrantHouseLoadingState extends GrantHouseState {}

class GrantHouseSuccessState extends GrantHouseState {
  List<GrantHouseModel> fetchedModel;
  GrantHouseSuccessState(this.fetchedModel);
  @override
  List<Object?> get props => [fetchedModel];
}

class GrantHouseFailureState extends GrantHouseState {
  String errMsg;
  GrantHouseFailureState(this.errMsg);
}
