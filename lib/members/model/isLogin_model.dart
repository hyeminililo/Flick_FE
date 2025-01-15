import 'package:json_annotation/json_annotation.dart';

part 'isLogin_model.g.dart';

@JsonSerializable()
class IsLoginResponse {
  final int statusCode; // 상태 코드
  final String message; // 메시지
  final bool data; // 첫 로그인 여부

  IsLoginResponse({
    required this.statusCode,
    required this.message,
    required this.data,
  });

  factory IsLoginResponse.fromJson(Map<String, dynamic> json) =>
      _$IsLoginResponseFromJson(json);

  Map<String, dynamic> toJson() => _$IsLoginResponseToJson(this);
}
