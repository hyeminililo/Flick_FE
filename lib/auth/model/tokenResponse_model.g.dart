// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tokenResponse_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TokenResponseModel _$TokenResponseModelFromJson(Map<String, dynamic> json) =>
    TokenResponseModel(
      statusCode: (json['statusCode'] as num).toInt(),
      message: json['message'] as String,
      data: TokenData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TokenResponseModelToJson(TokenResponseModel instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'message': instance.message,
      'data': instance.data,
    };
