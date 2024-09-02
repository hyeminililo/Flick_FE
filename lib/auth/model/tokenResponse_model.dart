import 'package:json_annotation/json_annotation.dart';

part 'tokenResponse_model.g.dart';

@JsonSerializable()
class TokenResponseModel {
  String? accessToken;
  String? refreshToken;
  TokenResponseModel({required this.accessToken, required this.refreshToken});

  factory TokenResponseModel.fromJson(Map<String, dynamic> json) =>
      _$TokenResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$TokenResponseModelToJson(this);
}
