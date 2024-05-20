part of 'animals_bloc.dart';

@immutable
abstract class AnimalsEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetAnimalsEvent extends AnimalsEvent{

}
