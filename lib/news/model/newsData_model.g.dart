// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'newsData_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewsInfoResDtos _$NewsInfoResDtosFromJson(Map<String, dynamic> json) =>
    NewsInfoResDtos(
      newsInfoResDtos: (json['newsInfoResDtos'] as List<dynamic>?)
          ?.map((e) => NewsInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$NewsInfoResDtosToJson(NewsInfoResDtos instance) =>
    <String, dynamic>{
      'newsInfoResDtos': instance.newsInfoResDtos,
    };
