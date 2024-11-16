import 'package:json_annotation/json_annotation.dart';

part 'memberPictureUrls_model.g.dart';

@JsonSerializable()
// class MemberPictureUrls {
//   // 요기 부분 추가함

//   final List<String> memberPictureUrls;

//   MemberPictureUrls({required this.memberPictureUrls});

//   factory MemberPictureUrls.fromJson(Map<String, dynamic> json) {
//     // JSON 구조에서 memberPictureUrls를 가져옵니다.
//     final urls = json['memberPictureUrls'] ?? [];
//     return MemberPictureUrls(
//       memberPictureUrls: List<String>.from(urls),
//     );
//   }

//   Map<String, dynamic> toJson() => _$MemberPictureUrlsToJson(this);
// }
// class MemberPictureUrls {
//   final List<String> memberPictureUrls;

//   MemberPictureUrls({required this.memberPictureUrls});

//   factory MemberPictureUrls.fromJson(Map<String, dynamic> json) {
//     return MemberPictureUrls(
//       memberPictureUrls:
//           List<String>.from(json['data']['memberPictureUrls'] ?? []),
//     );
//   }
// }

// class MemberPictureUrls {
//   final List<String> memberPictureUrls;

//   // 생성자
//   MemberPictureUrls({required this.memberPictureUrls});

//   // 자동 생성된 fromJson 메서드
//   factory MemberPictureUrls.fromJson(Map<String, dynamic> json) =>
//       _$MemberPictureUrlsFromJson(json['data']);

//   // 자동 생성된 toJson 메서드
//   Map<String, dynamic> toJson() => {'data': _$MemberPictureUrlsToJson(this)};
// }

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
