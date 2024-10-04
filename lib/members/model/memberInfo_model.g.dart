// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'memberInfo_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MemberInfo _$MemberInfoFromJson(Map<String, dynamic> json) => MemberInfo(
      id: (json['id'] as num).toInt(),
      email: json['email'] as String,
      picture: json['picture'] as String,
      nickname: json['nickname'] as String,
      school: json['school'] as String,
      gradeClass: json['gradeClass'] as String,
      type: $enumDecode(_$UserTypeEnumMap, json['type']),
      score: (json['score'] as num).toInt(),
      ecoLifeDuration: (json['ecoLifeDuration'] as num).toInt(),
      recentChallengeTitle: json['recentChallengeTitle'] as String,
      totalActionCount: (json['totalActionCount'] as num).toInt(),
    );

Map<String, dynamic> _$MemberInfoToJson(MemberInfo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'picture': instance.picture,
      'nickname': instance.nickname,
      'school': instance.school,
      'gradeClass': instance.gradeClass,
      'type': _$UserTypeEnumMap[instance.type]!,
      'score': instance.score,
      'ecoLifeDuration': instance.ecoLifeDuration,
      'recentChallengeTitle': instance.recentChallengeTitle,
      'totalActionCount': instance.totalActionCount,
    };

const _$UserTypeEnumMap = {
  UserType.STUDENT: 'STUDENT',
  UserType.GENERAL: 'GENERAL',
};
