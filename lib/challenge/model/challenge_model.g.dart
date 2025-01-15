// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'challenge_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Challenge _$ChallengeFromJson(Map<String, dynamic> json) => Challenge(
      type: $enumDecodeNullable(_$UserTypeEnumMap, json['type']),
      challengeInfoResDtos: (json['challengeInfoResDtos'] as List<dynamic>)
          .map((e) => ChallengeInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ChallengeToJson(Challenge instance) => <String, dynamic>{
      'type': _$UserTypeEnumMap[instance.type]!,
      'challengeInfoResDtos': instance.challengeInfoResDtos,
    };

const _$UserTypeEnumMap = {
  UserType.STUDENT: 'STUDENT',
  UserType.GENERAL: 'GENERAL',
};
