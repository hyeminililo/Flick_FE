import 'package:json_annotation/json_annotation.dart';

part 'token_model.g.dart';

@JsonSerializable()
class TokenData {
  String? accessToken;
  String? refreshToken;
  TokenData({required this.accessToken, required this.refreshToken});

  factory TokenData.fromJson(Map<String, dynamic> json) =>
      _$TokenDataFromJson(json);

  Map<String, dynamic> toJson() => _$TokenDataToJson(this);
}
