part of 'toilet_bloc.dart';

@immutable
abstract class ToiletEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetToiletEvent extends ToiletEvent {}
