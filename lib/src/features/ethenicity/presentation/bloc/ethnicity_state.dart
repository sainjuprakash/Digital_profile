part of 'ethnicity_bloc.dart';

@immutable
abstract class EthnicityState {
  @override
  List<Object> get props => [];
}

class EthnicityLoadingState extends EthnicityState {}

class EthnicitySuccessState extends EthnicityState {
  List<EthnicityModel> fetchedEthnicityModel;
  EthnicitySuccessState({required this.fetchedEthnicityModel});
}

class EthnicityFailureState extends EthnicityState {
  String errmsg;
  EthnicityFailureState({required this.errmsg});
}
