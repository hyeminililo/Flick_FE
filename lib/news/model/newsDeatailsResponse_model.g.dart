// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'newsDeatailsResponse_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewsDeatailsResponse _$NewsDeatailsResponseFromJson(
        Map<String, dynamic> json) =>
    NewsDeatailsResponse(
      statusCode: (json['statusCode'] as num).toInt(),
      message: json['message'] as String,
      data: json['data'] == null
          ? null
          : NewsInfo.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$NewsDeatailsResponseToJson(
        NewsDeatailsResponse instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'message': instance.message,
      'data': instance.data,
    };
