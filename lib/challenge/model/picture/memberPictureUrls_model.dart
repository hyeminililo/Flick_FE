import 'package:json_annotation/json_annotation.dart';

part 'memberPictureUrls_model.g.dart';

@JsonSerializable()
class MemberPictureUrls {
  final List<String> memberPictureUrls;

  // 생성자
  MemberPictureUrls({required this.memberPictureUrls});

  // 자동 생성된 fromJson 메서드
  factory MemberPictureUrls.fromJson(Map<String, dynamic> json) =>
      _$MemberPictureUrlsFromJson(json);

  // 자동 생성된 toJson 메서드
  Map<String, dynamic> toJson() => _$MemberPictureUrlsToJson(this);
}
