import 'package:flick_frontend/news/model/newsData_model.dart';
import 'package:flick_frontend/news/model/newsInfo_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'newsDeatailsResponse_model.g.dart';

@JsonSerializable()
class NewsDeatailsResponse {
  final int statusCode;
  final String message;
  // 이 부분이 list<NewsInfo>로 받아도 되는지 모르겠다

  // // final NewsInfo? data;
  final NewsInfo? data;

  NewsDeatailsResponse({
    required this.statusCode,
    required this.message,
    required this.data,
  });

  factory NewsDeatailsResponse.fromJson(Map<String, dynamic> json) =>
      _$NewsDeatailsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$NewsDeatailsResponseToJson(this);
}
