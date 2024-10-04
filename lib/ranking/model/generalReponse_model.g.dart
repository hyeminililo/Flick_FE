// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generalReponse_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GeneralRankingResponse _$GeneralRankingResponseFromJson(
        Map<String, dynamic> json) =>
    GeneralRankingResponse(
      statusCode: (json['statusCode'] as num).toInt(),
      message: json['message'] as String,
      data: json['data'],
    );

Map<String, dynamic> _$GeneralRankingResponseToJson(
        GeneralRankingResponse instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'message': instance.message,
      'data': instance.data,
    };
