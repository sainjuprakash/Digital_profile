part of 'earthquake_bloc.dart';

@immutable
abstract class EarthquakeState extends Equatable {
  @override
  List<Object?> get props => [];
}

class EarthquakeLoadingState extends EarthquakeState {}

class EarthquakeSuccessState extends EarthquakeState {
  List<EarthquakeModel> fetchedModel;
  EarthquakeSuccessState(this.fetchedModel);
  @override
  List<Object?> get props => [fetchedModel];
}

class EarthquakeFailureState extends EarthquakeState {
  String errMsg;
  EarthquakeFailureState(this.errMsg);
}
