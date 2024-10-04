import 'package:flick_frontend/members/model/members_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'memberInfo_model.g.dart';

@JsonSerializable()
class MemberInfo {
  final int id;
  final String email;
  final String picture;
  final String nickname;
  final String school;
  final String gradeClass;
  final UserType type;
  final int score;
  final int ecoLifeDuration;
  final String recentChallengeTitle;
  final int totalActionCount;

  MemberInfo(
      {required this.id,
      required this.email,
      required this.picture,
      required this.nickname,
      required this.school,
      required this.gradeClass,
      required this.type,
      required this.score,
      required this.ecoLifeDuration,
      required this.recentChallengeTitle,
      required this.totalActionCount});

  factory MemberInfo.fromJson(Map<String, dynamic> json) =>
      _$MemberInfoFromJson(json);

  Map<String, dynamic> toJson() => _$MemberInfoToJson(this);
}
