part of 'household_bloc.dart';

@immutable
abstract class HouseholdState extends Equatable {
  @override
  List<Object?> get props => [];
}

class HouseholdLoadingState extends HouseholdState {}

class HouseholdSuccessState extends HouseholdState {
  List<FamilyDetailsModel> fetchedModel;
  HouseholdSuccessState(this.fetchedModel);
}

class HouseholdFailureState extends HouseholdState {
  String errMsg;
  HouseholdFailureState(this.errMsg);
}
