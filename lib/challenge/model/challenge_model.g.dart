// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'challenge_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Challenge _$ChallengeFromJson(Map<String, dynamic> json) => Challenge(
      type: $enumDecode(_$UserTypeEnumMap, json['type']),
      challengeInfo:
          ChallengeInfo.fromJson(json['challengeInfo'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ChallengeToJson(Challenge instance) => <String, dynamic>{
      'type': _$UserTypeEnumMap[instance.type]!,
      'challengeInfo': instance.challengeInfo,
    };

const _$UserTypeEnumMap = {
  UserType.STUDENT: 'STUDENT',
  UserType.GENERAL: 'GENERAL',
};
