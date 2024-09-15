import 'package:flick_frontend/news/model/newsInfo_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'newsResponse_model.g.dart';

@JsonSerializable()
class NewsResponse {
  final int statusCode;
  final String message;
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
