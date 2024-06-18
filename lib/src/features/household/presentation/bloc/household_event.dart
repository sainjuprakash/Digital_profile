part of 'household_bloc.dart';

@immutable
abstract class HouseholdEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetHouseholdEvent extends HouseholdEvent {}
