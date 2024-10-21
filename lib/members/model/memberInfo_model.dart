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
  final UserType? type;
  final int score;
  final int ecoLifeDuration;
  final String? recentChallengeTitle;
  final int totalActionCount;

  MemberInfoModel({
    required this.id,
    required this.email,
    this.picture,
    required this.nickname,
    this.school,
    this.gradeClass,
    this.type,
    required this.score,
    required this.ecoLifeDuration,
    this.recentChallengeTitle,
    required this.totalActionCount,
  });

  factory MemberInfoModel.fromJson(Map<String, dynamic> json) {
    return MemberInfoModel(
      id: json['id'] as int,
      email: json['email'] as String,
      picture: json['picture'] as String?,
      nickname: json['nickname'] as String,
      school: json['school'] as String?,
      gradeClass: json['gradeClass'] as String?,
      type: json['type'] != null
          ? userTypeFromJson(json['type'] as String)
          : null,
      score: (json['score'] as int?) ?? 0, // 기본값 0 설정
      ecoLifeDuration: (json['ecoLifeDuration'] as int?) ?? 0, // 기본값 0 설정
      recentChallengeTitle: json['recentChallengeTitle'] as String?,
      totalActionCount: (json['totalActionCount'] as int?) ?? 0, // 기본값 0 설정
    );
  }

  Map<String, dynamic> toJson() => _$MemberInfoModelToJson(this);

  MemberInfoModel copyWith({
    String? nickname,
    String? picture,
  }) {
    return MemberInfoModel(
      id: id,
      email: email,
      picture: picture ?? this.picture,
      nickname: nickname ?? this.nickname,
      school: school,
      gradeClass: gradeClass,
      type: type,
      score: score,
      ecoLifeDuration: ecoLifeDuration,
      recentChallengeTitle: recentChallengeTitle,
      totalActionCount: totalActionCount,
    );
  }
}
