part of 'house_ownership_bloc.dart';

@immutable
abstract class HouseOwnershipState extends Equatable {
  @override
  List<Object?> get props => [];
}

class HouseOwnershipLoadingState extends HouseOwnershipState {}

class HouseOwnershipSuccessState extends HouseOwnershipState {
  List<HouseOwnershipModel> ownershipModel;
  HouseOwnershipSuccessState(this.ownershipModel);
  @override
  List<Object?> get props => [ownershipModel];
}

class HouseOwnershipFailureState extends HouseOwnershipState {
  String errMsg;
  HouseOwnershipFailureState(this.errMsg);
}
