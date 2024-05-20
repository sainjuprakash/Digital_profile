part of 'animals_bloc.dart';

@immutable
abstract class AnimalsState extends Equatable {
  @override
  List<Object?> get props => [];
}

class AnimalsLoadingState extends AnimalsState {}

class AnimalsSuccessState extends AnimalsState {
  List<AnimalsModel> fetchedAnimalsModel;
  AnimalsSuccessState(this.fetchedAnimalsModel);
}

class AnimalsFailureState extends AnimalsState {
  String errMsg;
  AnimalsFailureState(this.errMsg);
}
