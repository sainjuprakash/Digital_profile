part of 'earthquake_resistance_bloc.dart';

@immutable
abstract class EarthquakeResistanceEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetEarthquakeResistanceEvent extends EarthquakeResistanceEvent {}
