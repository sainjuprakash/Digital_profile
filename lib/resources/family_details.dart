import 'package:freezed_annotation/freezed_annotation.dart';

part 'family_details.freezed.dart';
part 'family_details.g.dart';

@JsonSerializable()
@freezed
class FamilyDetailsModel with _$FamilyDetailsModel {
  const FamilyDetailsModel._();

  factory FamilyDetailsModel({
    required int id,
    @JsonKey(name: "group_settlement/survey_ward_no") required int wardNo,
    @JsonKey(name: "group_settlement/Sett_Name") required String setName,
    @JsonKey(name: "group_settlement/Road") required String road,
    @JsonKey(name: "group_settlement/road_to_house") required String roadToHouse,
    @JsonKey(name: "group_repondent/Respondent") required String respondent,
    @JsonKey(name: "group_repondent/respondent_mobile") required int phoneNumber,
    @JsonKey(name: "group_repondent/Relation" ) required String relation,
    @JsonKey(name: "group_repondent/migration_type")required String migrationType,
    @JsonKey(name:  "group_repondent/Family_number") required int familyCount,
  }) = _FamilyDetailsModel;

  factory FamilyDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$FamilyDetailsModelFromJson(json);
}

/*
class UserModel {
  final int id;
  final int surveyWardNumber;
  final String setName;
  final String setRoad;
  final String roadTohouse;
  final String respondent;
  final int phoneNumber;
  final bool respondentRelation;
  final String migrationType;
  final int familyMemberNumber;
  final List<GroupFamily> familyData;
  final bool death;
  final String insurence;
  final double distHospital;

  UserModel(
      {required this.id,
      required this.surveyWardNumber,
      required this.setName,
      required this.setRoad,
      required this.roadTohouse,
      required this.respondent,
      required this.phoneNumber,
      required this.respondentRelation,
      required this.migrationType,
      required this.familyMemberNumber,
      required this.familyData,
      required this.death,
      required this.insurence,
      required this.distHospital});
}

class GroupFamily {
  final String name;
  final String lastName;
  final String ethenicity;
  final int sex;
  final String relationHead;
  final int age;
  final String language;
  final String religion;
  final String maritalStatus;
  final String education;
  final String anySpecialist;
  final bool name_;
  final String livingStatus;
  final String disability;
  final String healthCondition;

  GroupFamily({
    required this.name,
    required this.lastName,
    required this.ethenicity,
    required this.sex,
    required this.relationHead,
    required this.age,
    required this.language,
    required this.religion,
    required this.maritalStatus,
    required this.education,
    required this.anySpecialist,
    required this.name_,
    required this.livingStatus,
    required this.disability,
    required this.healthCondition,
  });
}

class PieData {
  static List<UserModel> data = [
    UserModel(
        id: 1234,
        surveyWardNumber: 1,
        setName: 'changu',
        setRoad: 'changu road',
        roadTohouse: 'one',
        respondent: 'self',
        phoneNumber: 1235689,
        respondentRelation: true,
        migrationType: 'permanent',
        familyMemberNumber: 3,
        familyData: FamilyData.familyData,
        death: false,
        insurence: 'life insurance',
        distHospital: 10)
  ];
}

class FamilyData {
  static List<GroupFamily> familyData = [
    GroupFamily(
        name: 'Srijana',
        lastName: 'Gurung',
        ethenicity: 'Gurung',
        sex: 1,
        relationHead: 'Self',
        age: 30,
        language: 'gurung',
        religion: 'hindu',
        maritalStatus: 'unmarried',
        education: 'slc',
        anySpecialist: 'student',
        name_: true,
        livingStatus: 'country side',
        disability: 'able',
        healthCondition: 'healthy'),
    GroupFamily(
        name: 'Champa',
        lastName: 'Gurung',
        ethenicity: 'Gurung',
        sex: 1,
        relationHead: 'Self',
        age: 30,
        language: 'gurung',
        religion: 'hindu',
        maritalStatus: 'unmarried',
        education: 'slc',
        anySpecialist: 'student',
        name_: true,
        livingStatus: 'country side',
        disability: 'able',
        healthCondition: 'healthy')
  ];
}
*/
