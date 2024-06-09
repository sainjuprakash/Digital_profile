part of 'child_worker_bloc.dart';

@immutable
abstract class ChildWorkerEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetChildWorkerEvent extends ChildWorkerEvent {}
