part of 'earthquake_grant_bloc.dart';

@immutable
abstract class EarthquakeGrantState extends Equatable {
  @override
  List<Object?> get props => [];
}

class EarthquakeGrantLoadingState extends EarthquakeGrantState {}

class EarthquakeGrantSuccessState extends EarthquakeGrantState {
  List<EarthquakeGrantModel> fetchedModel;
  EarthquakeGrantSuccessState(this.fetchedModel);
  @override
  List<Object?> get props => [fetchedModel];
}

class EarthquakeGrantFailureState extends EarthquakeGrantState {
  String errMsg;
  EarthquakeGrantFailureState(this.errMsg);
}
