part of 'marriage_status_bloc.dart';

@immutable
abstract class MarriageStatusEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class GetMarriageStatusEvent extends MarriageStatusEvent {}
