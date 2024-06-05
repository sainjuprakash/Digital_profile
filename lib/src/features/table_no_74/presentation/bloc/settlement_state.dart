part of 'settlement_bloc.dart';

@immutable
abstract class SettlementState extends Equatable {
  @override
  List<Object?> get props => [];
}

class SettlementLoadingState extends SettlementState {}

class SettlementSuccessState extends SettlementState {
  List<SettlementModel> fetchedModel;
  SettlementSuccessState(this.fetchedModel);
  @override
  List<Object?> get props => [fetchedModel];
}

class SettlementFailureState extends SettlementState {
  String errMsg;
  SettlementFailureState(this.errMsg);
}
