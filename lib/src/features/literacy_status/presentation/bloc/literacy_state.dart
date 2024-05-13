part of 'literacy_bloc.dart';

@immutable
abstract class LiteracyState extends Equatable {
  @override
  List<Object?> get props => [];
}

class LiteracyLoadingState extends LiteracyState {}

class LiteracySuccessState extends LiteracyState {
  List<LiteracyModel> literacyModel;
  LiteracySuccessState({required this.literacyModel});
}

class LiteracyFailureState extends LiteracyState {
  String errMsg;
  LiteracyFailureState({required this.errMsg});
}
