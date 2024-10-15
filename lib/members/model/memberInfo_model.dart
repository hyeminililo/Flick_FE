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
  final UserType? type; // nullable로 수정
  final int? score;
  final int? ecoLifeDuration;
  final String? recentChallengeTitle;
  final int? totalActionCount;

  MemberInfoModel({
    required this.id,
    required this.email,
    this.picture,
    required this.nickname,
    this.school,
    this.gradeClass,
    this.type,
    this.score,
    this.ecoLifeDuration,
    this.recentChallengeTitle,
    this.totalActionCount,
  });

  factory MemberInfoModel.fromJson(Map<String, dynamic> json) =>
      _$MemberInfoModelFromJson(json);

  Map<String, dynamic> toJson() => _$MemberInfoModelToJson(this);

  // copyWith 메서드 추가
  MemberInfoModel copyWith({
    int? id,
    String? email,
    String? picture,
    String? nickname,
    String? school,
    String? gradeClass,
    UserType? type,
    int? score,
    int? ecoLifeDuration,
    String? recentChallengeTitle,
    int? totalActionCount,
  }) {
    return MemberInfoModel(
      id: id ?? this.id,
      email: email ?? this.email,
      picture: picture ?? this.picture,
      nickname: nickname ?? this.nickname,
      school: school ?? this.school,
      gradeClass: gradeClass ?? this.gradeClass,
      type: type ?? this.type,
      score: score ?? this.score,
      ecoLifeDuration: ecoLifeDuration ?? this.ecoLifeDuration,
      recentChallengeTitle: recentChallengeTitle ?? this.recentChallengeTitle,
      totalActionCount: totalActionCount ?? this.totalActionCount,
    );
  }
}
