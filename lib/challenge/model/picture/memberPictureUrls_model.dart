import 'package:json_annotation/json_annotation.dart';

part 'memberPictureUrls_model.g.dart';

@JsonSerializable()
class MemberPictureUrls {
  // 요기 부분 추가함

  final List<String> memberPictureUrls;

  MemberPictureUrls({required this.memberPictureUrls});

  factory MemberPictureUrls.fromJson(Map<String, dynamic> json) {
    // JSON 구조에서 memberPictureUrls를 가져옵니다.
    final urls = json['memberPictureUrls'] ?? [];
    return MemberPictureUrls(
      memberPictureUrls: List<String>.from(urls),
    );
  }

  Map<String, dynamic> toJson() => _$MemberPictureUrlsToJson(this);
}
