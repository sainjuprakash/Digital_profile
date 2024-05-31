part of 'house_ownership_bloc.dart';

@immutable
abstract class HouseOwnershipEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetHouseOwnershipEvent extends HouseOwnershipEvent{

}
