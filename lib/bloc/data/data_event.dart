part of 'data_bloc.dart';

@immutable
abstract class DataEvent extends Equatable{
  const DataEvent();
}

class LoadDataEvent extends Equatable{
  @override
  List<Object?> get props => [];
}