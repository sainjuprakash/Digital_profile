part of 'electricity_bloc.dart';

@immutable
abstract class ElectricityEvent extends Equatable{
  @override
  List<Object?> get props => [];
}

class GetElectricityEvent extends ElectricityEvent{

}
