part of 'house_bloc.dart';

@immutable
abstract class HouseEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetHouseEvent extends HouseEvent {}
