part of 'grant_stage_bloc.dart';

@immutable
abstract class GrantStageEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetGrantStageEvent extends GrantStageEvent {}
