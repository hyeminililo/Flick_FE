import 'package:json_annotation/json_annotation.dart';

part 'members_model.g.dart';

enum UserType { STUDENT, GENERAL }

UserType userTypeFromJson(String? type) {
  switch (type) {
    case 'STUDENT':
      return UserType.STUDENT;
    case 'GENERAL':
      return UserType.GENERAL;

    default:
      return UserType.GENERAL; // 기본값 설정
  }
}

@JsonSerializable()
class Members {
  UserType type;
  String nickname;
  String? school;
  String? gradeClass;

  Members(
      {required this.type,
      required this.nickname,
      required this.school,
      required this.gradeClass});

  factory Members.fromJson(Map<String, dynamic> json) =>
      _$MembersFromJson(json);

  Map<String, dynamic> toJson() => _$MembersToJson(this);

  Members copyWith({
    UserType? type,
    String? nickname,
    String? school,
    String? gradeClass,
  }) {
    return Members(
      type: type ?? this.type,
      nickname: nickname ?? this.nickname,
      school: school ?? this.school,
      gradeClass: gradeClass ?? this.gradeClass,
    );
  }
}
