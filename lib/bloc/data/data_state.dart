part of 'data_bloc.dart';

@immutable
abstract class DataState extends Equatable{}


//Data Loading State
class DataLoadingState extends DataState {
  List<Object> get props => [];
}

//Data Loadad state
class DataLoadedState extends DataState {
  List<Object> get props => [];
}

//Data Loading Failed State
class DataFailureState extends DataState {
  List<Object> get props => [];
}
