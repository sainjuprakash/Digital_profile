part of 'earthquake_resistance_bloc.dart';

@immutable
abstract class EarthquakeResistanceState extends Equatable {
  @override
  List<Object?> get props => [];
}

class EarthquakeResistanceInitialState extends EarthquakeResistanceState {}

class EarthquakeResistanceSuccessState extends EarthquakeResistanceState {
  List<EarthquakeResistanceModel> fetchedModel;
  EarthquakeResistanceSuccessState(this.fetchedModel);
  @override
  List<Object?> get props => [fetchedModel];
}

class EarthquakeResistanceFailureState extends EarthquakeResistanceState {
  String errMsg;
  EarthquakeResistanceFailureState(this.errMsg);
}
