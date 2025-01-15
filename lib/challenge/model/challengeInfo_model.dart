// 크게 challengeInfo의 정보를 담고있는 모델 -> 여기 안에 아이디 및 타이틀 등 존재
import 'package:json_annotation/json_annotation.dart';

part 'challengeInfo_model.g.dart';

@JsonSerializable()
class ChallengeInfo {
  final int challengeId;
  final String title;
  final List<String>? hashtag;
  final String? contents;
  final String? imageUrl;
  final int? joinMembersCount;

  ChallengeInfo({
    required this.challengeId,
    required this.title,
    required this.hashtag,
    required this.contents,
    required this.imageUrl,
    required this.joinMembersCount,
  });

  factory ChallengeInfo.fromJson(Map<String, dynamic> json) =>
      _$ChallengeInfoFromJson(json);

  Map<String, dynamic> toJson() => _$ChallengeInfoToJson(this);
}
