import 'package:flick_frontend/auth/model/token_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'tokenResponse_model.g.dart';

@JsonSerializable()
class TokenResponseModel {
  final int statusCode;
  final String message;
  final TokenData data;

  TokenResponseModel({
    required this.statusCode,
    required this.message,
    required this.data,
  });

  factory TokenResponseModel.fromJson(Map<String, dynamic> json) =>
      _$TokenResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$TokenResponseModelToJson(this);
}
