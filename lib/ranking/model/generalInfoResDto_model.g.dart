// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generalInfoResDto_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GeneralRankingInfoResDto _$GeneralRankingInfoResDtoFromJson(
        Map<String, dynamic> json) =>
    GeneralRankingInfoResDto(
      memberInfoResDtos: (json['memberInfoResDtos'] as List<dynamic>)
          .map((e) => MemberInfoModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      pageInfoResDto:
          PageInfo.fromJson(json['pageInfoResDto'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GeneralRankingInfoResDtoToJson(
        GeneralRankingInfoResDto instance) =>
    <String, dynamic>{
      'memberInfoResDtos': instance.memberInfoResDtos,
      'pageInfoResDto': instance.pageInfoResDto,
    };
