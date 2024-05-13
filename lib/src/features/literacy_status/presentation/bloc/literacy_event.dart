part of 'literacy_bloc.dart';

@immutable
abstract class LiteracyEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetLiteracyEvent extends LiteracyEvent {}
