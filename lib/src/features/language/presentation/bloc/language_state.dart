part of 'language_bloc.dart';

@immutable
abstract class LanguageState extends Equatable {
  @override
  List<Object?> get props => [];
}

class LanguageLoadingState extends LanguageState {}

class LanguageLoadedState extends LanguageState {
  List<LanguageModel> fetchedLanguageModel;
  LanguageLoadedState({required this.fetchedLanguageModel});

  @override
  List<Object?> get props => [fetchedLanguageModel];
}

class LanguageFailureState extends LanguageState {
  final String errmsg;
  LanguageFailureState({required this.errmsg});
}
