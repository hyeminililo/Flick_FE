import 'package:flick_frontend/members/model/members_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'memberInfo_model.g.dart';

@JsonSerializable()
class MemberInfoModel {
  final int id;
  final String email;
  final String? picture;
  final String nickname;
  final String? school;
  final String? gradeClass;
  final UserType type;
  final int? score;
  final int? ecoLifeDuration;
  final String? recentChallengeTitle;
  final int? totalActionCount;

  MemberInfoModel(
      {required this.id,
      required this.email,
      this.picture,
      required this.nickname,
      this.school,
      this.gradeClass,
      required this.type,
      this.score,
      this.ecoLifeDuration,
      this.recentChallengeTitle,
      this.totalActionCount});

  factory MemberInfoModel.fromJson(Map<String, dynamic> json) =>
      _$MemberInfoModelFromJson(json);

  Map<String, dynamic> toJson() => _$MemberInfoModelToJson(this);
}
