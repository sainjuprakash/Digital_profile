// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'family_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FamilyDetailsModelImpl _$$FamilyDetailsModelImplFromJson(
        Map<String, dynamic> json) =>
    _$FamilyDetailsModelImpl(
      id: json['_id'] as int,
      wardNo: json['group_settlement/survey_ward_no'] as String,
      setName: json['group_settlement/Sett_Name'] as String,
      road: json['group_settlement/Road'] as String,
      roadToHouse: json['group_settlement/road_to_house'] as String,
      respondent: json['group_repondent/Respondent'] as String,
      phoneNumber: json['group_repondent/respondent_mobile'] as String,
      relation: json['group_repondent/Relation'] as String,
      migrationType: json['group_repondent/migration_type'] as String,
      familyCount: json['group_repondent/Family_number'] as String,
      isDeath: json['group_deathqty/Death'] as String,
      insurance: json['group_insu/Insurance'] as String,
    );

Map<String, dynamic> _$$FamilyDetailsModelImplToJson(
        _$FamilyDetailsModelImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'group_settlement/survey_ward_no': instance.wardNo,
      'group_settlement/Sett_Name': instance.setName,
      'group_settlement/Road': instance.road,
      'group_settlement/road_to_house': instance.roadToHouse,
      'group_repondent/Respondent': instance.respondent,
      'group_repondent/respondent_mobile': instance.phoneNumber,
      'group_repondent/Relation': instance.relation,
      'group_repondent/migration_type': instance.migrationType,
      'group_repondent/Family_number': instance.familyCount,
      'group_deathqty/Death': instance.isDeath,
      'group_insu/Insurance': instance.insurance,
    };
