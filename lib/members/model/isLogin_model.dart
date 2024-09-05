import 'package:json_annotation/json_annotation.dart';

part 'isLogin_model.g.dart';

@JsonSerializable()
class IsLoginResponse {
  final bool isFirstLoginData;

  IsLoginResponse({required this.isFirstLoginData});
  factory IsLoginResponse.fromJson(Map<String, dynamic> json) =>
      _$IsLoginResponseFromJson(json);

  Map<String, dynamic> toJson() => _$IsLoginResponseToJson(this);
}
