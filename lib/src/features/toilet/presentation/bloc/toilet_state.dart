part of 'toilet_bloc.dart';

@immutable
abstract class ToiletState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ToiletLoadingState extends ToiletState {}

class ToiletSuccessState extends ToiletState {
  List<ToiletModel> toiletModel;
  ToiletSuccessState({required this.toiletModel});
  @override
  List<Object?> get props => [toiletModel];
}

class ToiletFailureState extends ToiletState {
  String errMsg;
  ToiletFailureState({required this.errMsg});
}
