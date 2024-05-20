part of 'home_facilities_bloc.dart';

@immutable
abstract class HomeFacilitiesState extends Equatable {
  @override
  List<Object?> get props => [];
}

class HomeFacilitiesLoadingState extends HomeFacilitiesState {}

class HomeFacilitiesSuccessState extends HomeFacilitiesState {
  List<HomeFacilitiesModel> homeFacilitiesModel;
  HomeFacilitiesSuccessState(this.homeFacilitiesModel);

  @override
  List<Object?> get props => [homeFacilitiesModel];
}

class HomeFacilitiesFailureState extends HomeFacilitiesState {
  String errMsg;
  HomeFacilitiesFailureState(this.errMsg);
}
