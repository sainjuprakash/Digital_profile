part of 'meat_bloc.dart';

@immutable
abstract class MeatEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetMeatEvent extends MeatEvent{

}
