// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'challengeInfo_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChallengeInfo _$ChallengeInfoFromJson(Map<String, dynamic> json) =>
    ChallengeInfo(
      challengeId: (json['challengeId'] as num).toInt(),
      title: json['title'] as String,
      hashtag:
          (json['hashtag'] as List<dynamic>?)?.map((e) => e as String).toList(),
      contents: json['contents'] as String?,
      imageUrl: json['imageUrl'] as String?,
      joinMembersCount: (json['joinMembersCount'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ChallengeInfoToJson(ChallengeInfo instance) =>
    <String, dynamic>{
      'challengeId': instance.challengeId,
      'title': instance.title,
      'hashtag': instance.hashtag,
      'contents': instance.contents,
      'imageUrl': instance.imageUrl,
      'joinMembersCount': instance.joinMembersCount,
    };
