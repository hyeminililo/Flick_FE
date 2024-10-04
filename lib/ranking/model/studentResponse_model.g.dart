// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'studentResponse_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StudentRankingResponse _$StudentRankingResponseFromJson(
        Map<String, dynamic> json) =>
    StudentRankingResponse(
      statusCode: (json['statusCode'] as num).toInt(),
      message: json['message'] as String,
      data: json['data'] as List<dynamic>,
    );

Map<String, dynamic> _$StudentRankingResponseToJson(
        StudentRankingResponse instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'message': instance.message,
      'data': instance.data,
    };
