import 'package:flick_frontend/news/model/newsInfo_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'newsResponse_model.g.dart';

@JsonSerializable()
class NewsResponse {
  final int statusCode;
  final String message;
  // data 라고 해도 괜찮은지 모르겠ㄲ음 newsInfo로 안 해도 될지 모루겠음 -> 음 data로 해야할 것 같음
  final List<NewsInfo>? data;

  NewsResponse({
    required this.statusCode,
    required this.message,
    required this.data,
  });

  factory NewsResponse.fromJson(Map<String, dynamic> json) =>
      _$NewsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$NewsResponseToJson(this);
}
