// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'isLogin_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IsLoginResponse _$IsLoginResponseFromJson(Map<String, dynamic> json) =>
    IsLoginResponse(
      statusCode: (json['statusCode'] as num).toInt(),
      message: json['message'] as String,
      data: json['data'] as bool,
    );

Map<String, dynamic> _$IsLoginResponseToJson(IsLoginResponse instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'message': instance.message,
      'data': instance.data,
    };
