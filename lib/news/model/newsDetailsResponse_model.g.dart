// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'newsDetailsResponse_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewsDetailsResponse _$NewsDetailsResponseFromJson(Map<String, dynamic> json) =>
    NewsDetailsResponse(
      statusCode: (json['statusCode'] as num).toInt(),
      message: json['message'] as String,
      data: NewsInfo.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$NewsDetailsResponseToJson(
        NewsDetailsResponse instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'message': instance.message,
      'data': instance.data,
    };
