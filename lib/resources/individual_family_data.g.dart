// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'individual_family_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$IndividualFamilyDataImpl _$$IndividualFamilyDataImplFromJson(
        Map<String, dynamic> json) =>
    _$IndividualFamilyDataImpl(
      individualName: json['group_family/Name'] as String,
      lastName: json['group_family/Last_name'] as String,
      ethnicity: json['group_family/Ethnicity'] as String,
      sex: json['group_family/Sex'] as String,
      hhdHead: json['group_family/Relation_HhdHead'] as String,
      age: json['group_family/Age'] as String,
      language: json['group_family/Language'] as String,
      religion: json['group_family/Religion'] as String,
      maritalStatus: json['group_family/Marital_status'] as String,
      education: json['group_family/Education'] as String,
      specialist: json['group_family/any_specialist'] as String,
      occupation: json['group_family/Occupation'] as String,
      name: json['group_family/_Name_'] as String,
      livinhStatus: json['group_family/Living_status'] as String,
      disability: json['group_family/Disability'] as String,
      healthCondition: json['group_family/hlth_condi'] as String,
    );

Map<String, dynamic> _$$IndividualFamilyDataImplToJson(
        _$IndividualFamilyDataImpl instance) =>
    <String, dynamic>{
      'group_family/Name': instance.individualName,
      'group_family/Last_name': instance.lastName,
      'group_family/Ethnicity': instance.ethnicity,
      'group_family/Sex': instance.sex,
      'group_family/Relation_HhdHead': instance.hhdHead,
      'group_family/Age': instance.age,
      'group_family/Language': instance.language,
      'group_family/Religion': instance.religion,
      'group_family/Marital_status': instance.maritalStatus,
      'group_family/Education': instance.education,
      'group_family/any_specialist': instance.specialist,
      'group_family/Occupation': instance.occupation,
      'group_family/_Name_': instance.name,
      'group_family/Living_status': instance.livinhStatus,
      'group_family/Disability': instance.disability,
      'group_family/hlth_condi': instance.healthCondition,
    };
