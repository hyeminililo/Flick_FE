// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'memberInfo_model.dart';

// **************************************************************************

Map<String, dynamic> _$MemberInfoModelToJson(MemberInfoModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'picture': instance.picture,
      'nickname': instance.nickname,
      'school': instance.school,
      'gradeClass': instance.gradeClass,
      'type': _$UserTypeEnumMap[instance.type],
      'score': instance.score,
      'ecoLifeDuration': instance.ecoLifeDuration,
      'recentChallengeTitle': instance.recentChallengeTitle,
      'totalActionCount': instance.totalActionCount,
    };

const _$UserTypeEnumMap = {
  UserType.STUDENT: 'STUDENT',
  UserType.GENERAL: 'GENERAL',
};
