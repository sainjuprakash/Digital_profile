part of 'residence_bloc.dart';

@immutable
abstract class ResidenceEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class GetResidenceEvent extends ResidenceEvent {}
