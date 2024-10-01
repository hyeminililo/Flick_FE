import 'package:json_annotation/json_annotation.dart';

part 'newsInfo_model.g.dart';

@JsonSerializable()
class NewsInfo {
  // to do : 뉴스 정보에 해당하는 부분에 뉴스 아이디 값 등등 적어두기 그러고 응답 부분 관련 모델 클래스 따로 만들기
  final int newsId;
  final String title;
  final String broadcastingCompany;
  final String date;
  final String contents;
  final String? url;
  final String? picture;
  final int? viewCount;
  final int? likeCount;
  final bool? isLike;

  NewsInfo({
    required this.newsId,
    required this.title,
    required this.broadcastingCompany,
    required this.date,
    required this.contents,
    this.url,
    this.picture,
    this.viewCount,
    this.likeCount,
    this.isLike,
  });

  factory NewsInfo.fromJson(Map<String, dynamic> json) =>
      _$NewsInfoFromJson(json);

  Map<String, dynamic> toJson() => _$NewsInfoToJson(this);
}
