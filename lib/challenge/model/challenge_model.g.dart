// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'challenge_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Challenge _$ChallengeFromJson(Map<String, dynamic> json) => Challenge(
      type: $enumDecode(_$UserTypeEnumMap, json['type']),
      challengeInfo: (json['challengeInfo'] as List<dynamic>)
          .map((e) => ChallengeInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ChallengeToJson(Challenge instance) => <String, dynamic>{
      'type': _$UserTypeEnumMap[instance.type]!,
      'challengeInfo': instance.challengeInfo,
    };

const _$UserTypeEnumMap = {
  UserType.STUDENT: 'STUDENT',
  UserType.GENERAL: 'GENERAL',
};
