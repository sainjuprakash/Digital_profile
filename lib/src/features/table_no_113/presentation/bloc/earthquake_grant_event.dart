part of 'earthquake_grant_bloc.dart';

@immutable
abstract class EarthquakeGrantEvent extends Equatable{
  @override
  List<Object?> get props => [];
}

class GetEarthquakeGrantEvent extends EarthquakeGrantEvent{

}
