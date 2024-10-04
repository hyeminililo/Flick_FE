// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generalReponse_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GeneralRankingResponse _$GeneralRankingResponseFromJson(
        Map<String, dynamic> json) =>
    GeneralRankingResponse(
      memberInfoResDtos: (json['memberInfoResDtos'] as List<dynamic>)
          .map((e) => MemberInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
      pageInfoResDto:
          PageInfo.fromJson(json['pageInfoResDto'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GeneralRankingResponseToJson(
        GeneralRankingResponse instance) =>
    <String, dynamic>{
      'memberInfoResDtos': instance.memberInfoResDtos,
      'pageInfoResDto': instance.pageInfoResDto,
    };
