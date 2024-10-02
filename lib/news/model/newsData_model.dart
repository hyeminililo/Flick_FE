import 'package:flick_frontend/news/model/newsInfo_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'newsData_model.g.dart';

@JsonSerializable()
class NewsInfoResDtos {
  @JsonKey(name: 'newsInfoResDtos') // JSON 키를 맞추기 위해 사용
  final List<NewsInfo>? newsInfoResDtos;

  NewsInfoResDtos({required this.newsInfoResDtos});

  factory NewsInfoResDtos.fromJson(Map<String, dynamic> json) =>
      _$NewsInfoResDtosFromJson(json);

  Map<String, dynamic> toJson() => _$NewsInfoResDtosToJson(this);
}
