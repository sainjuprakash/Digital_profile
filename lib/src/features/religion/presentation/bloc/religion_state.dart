part of 'religion_bloc.dart';

@immutable
abstract class ReligionState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ReligionLoadingState extends ReligionState {}

class ReligionSuccessState extends ReligionState {
  List<ReligionModel> religionModel;
  ReligionSuccessState({required this.religionModel});

  @override
  List<Object?> get props => [religionModel];
}

class ReligionFailureState extends ReligionState {
  String errMsg;
  ReligionFailureState({required this.errMsg});
}
