part of 'settlement_bloc.dart';

@immutable
abstract class SettlementEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetSettlementEvent extends SettlementEvent {}
