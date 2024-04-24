part of 'language_bloc.dart';

@immutable
abstract class LanguageEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class LoadLanguageEvent extends LanguageEvent {}
