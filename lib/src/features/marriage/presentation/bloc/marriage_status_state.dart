part of 'marriage_status_bloc.dart';

@immutable
abstract class MarriageStatusState extends Equatable {
  @override
  List<Object> get props => [];
}

class MarriageLoadingState extends MarriageStatusState {}

class MarriageSuccessState extends MarriageStatusState {
  List<MarriageStatusModel> marriageModel;
  MarriageSuccessState({required this.marriageModel});
}

class MarriageFailureState extends MarriageStatusState {
  String errMsg;
  MarriageFailureState({required this.errMsg});
}
