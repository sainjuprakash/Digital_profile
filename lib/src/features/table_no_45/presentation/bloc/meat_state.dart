part of 'meat_bloc.dart';

@immutable
abstract class MeatState extends Equatable {
  @override
  List<Object?> get props => [];
}

class MeatLoadingState extends MeatState {}

class MeatSuccessState extends MeatState {
  List<MeatModel> fetchedModel;
  MeatSuccessState(this.fetchedModel);
}

class MeatFailureState extends MeatState {
  String errMsg;
  MeatFailureState(this.errMsg);
}
