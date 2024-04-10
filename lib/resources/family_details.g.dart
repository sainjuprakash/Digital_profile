// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'family_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FamilyDetailsModelImpl _$$FamilyDetailsModelImplFromJson(
        Map<String, dynamic> json) =>
    _$FamilyDetailsModelImpl(
      id: json['id'] as int,
      wardNo: json['ward_no'] as int,
      setName: json['sett_name'] as String,
      road: json['set_road'] as String,
      roadToHouse: json['road_to_house'] as String,
      respondent: json['respondent'] as String,
      phoneNumber: json['phone_num'] as int,
      relation: json['relation'] as String,
      migrationType: json['migration_type'] as String,
      familyCount: json['family_count'] as int,
    );

Map<String, dynamic> _$$FamilyDetailsModelImplToJson(
        _$FamilyDetailsModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'ward_no': instance.wardNo,
      'sett_name': instance.setName,
      'set_road': instance.road,
      'road_to_house': instance.roadToHouse,
      'respondent': instance.respondent,
      'phone_num': instance.phoneNumber,
      'relation': instance.relation,
      'migration_type': instance.migrationType,
      'family_count': instance.familyCount,
    };
