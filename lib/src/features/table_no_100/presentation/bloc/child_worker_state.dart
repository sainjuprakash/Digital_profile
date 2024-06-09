part of 'child_worker_bloc.dart';

@immutable
abstract class ChildWorkerState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ChildWorkerLoadingState extends ChildWorkerState {}

class ChildWorkerSuccessState extends ChildWorkerState {
  List<ChildWorkerModel> fetchedModel;
  ChildWorkerSuccessState(this.fetchedModel);
  @override
  List<Object?> get props => [fetchedModel];
}

class ChildWorkerFailureState extends ChildWorkerState {
  String errMsg;
  ChildWorkerFailureState(this.errMsg);
}
