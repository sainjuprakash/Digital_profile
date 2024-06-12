part of 'grant_house_bloc.dart';

@immutable
abstract class GrantHouseEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetGrantHouseEvent extends GrantHouseEvent {}
