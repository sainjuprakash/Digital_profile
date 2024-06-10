part of 'earthquake_bloc.dart';

@immutable
abstract class EarthquakeEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetEarthquakeEvent extends EarthquakeEvent {}
