// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'members_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Members_Model _$Members_ModelFromJson(Map<String, dynamic> json) =>
    Members_Model(
      type: $enumDecode(_$UserTypeEnumMap, json['type']),
      nickname: json['nickname'] as String,
      school: json['school'] as String,
      gradeClass: json['gradeClass'] as String,
    );

Map<String, dynamic> _$Members_ModelToJson(Members_Model instance) =>
    <String, dynamic>{
      'type': _$UserTypeEnumMap[instance.type]!,
      'nickname': instance.nickname,
      'school': instance.school,
      'gradeClass': instance.gradeClass,
    };

const _$UserTypeEnumMap = {
  UserType.STUDENT: 'STUDENT',
  UserType.GENERAL: 'GENERAL',
};
