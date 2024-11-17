// import 'package:flick_frontend/news/model/newsInfo_model.dart';
// import 'package:json_annotation/json_annotation.dart';

// part 'newsResponse_model.g.dart';

// @JsonSerializable()
// class NewsResponse {
//   final int statusCode;
//   final String message;
//   // 이 부분이 list<NewsInfo>로 받아도 되는지 모르겠다

//   // final NewsInfo? data;
//   final List<NewsInfo>? data;

//   NewsResponse({
//     required this.statusCode,
//     required this.message,
//     required this.data,
//   });

//   factory NewsResponse.fromJson(Map<String, dynamic> json) =>
//       _$NewsResponseFromJson(json);

//   Map<String, dynamic> toJson() => _$NewsResponseToJson(this);
// }
import 'package:flick_frontend/news/model/newsData_model.dart';
import 'package:flick_frontend/news/model/newsInfo_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'newsResponse_model.g.dart';

@JsonSerializable()
class NewsResponse {
  final int statusCode;
  final String message;
  // 이 부분이 list<NewsInfo>로 받아도 되는지 모르겠다

  // // final NewsInfo? data;
  final NewsInfoResDtos? data;

  NewsResponse({
    required this.statusCode,
    required this.message,
    required this.data,
  });

  factory NewsResponse.fromJson(Map<String, dynamic> json) =>
      _$NewsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$NewsResponseToJson(this);
}
