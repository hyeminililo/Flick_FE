import 'package:flick_frontend/challenge/model/challengeInfo_model.dart';
import 'package:flick_frontend/members/model/members_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'challenge_model.g.dart';

// usertype과 challenge 정보를 담고있는 challengeInfo를 가지고 있는 모델
@JsonSerializable()
class Challenge {
  final UserType type;

  @JsonKey(name: 'challengeInfoResDtos')
  final List<ChallengeInfo> challengeInfoResDtos;

  Challenge({
    UserType? type,
    required this.challengeInfoResDtos,
  }) : type = type ?? UserType.GENERAL;

  factory Challenge.fromJson(Map<String, dynamic> json) =>
      _$ChallengeFromJson(json);

  Map<String, dynamic> toJson() => _$ChallengeToJson(this);
}
