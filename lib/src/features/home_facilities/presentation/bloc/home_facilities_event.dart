part of 'home_facilities_bloc.dart';

@immutable
abstract class HomeFacilitiesEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class GetHomeFacilitiesEvent extends HomeFacilitiesEvent {}
