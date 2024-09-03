import 'package:json_annotation/json_annotation.dart';

part 'members_model.g.dart';

enum UserType { STUDENT, GENERAL }

@JsonSerializable()
class Members {
  UserType type;
  String nickname;
  String school;
  String gradeClass;

  Members(
      {required this.type,
      required this.nickname,
      required this.school,
      required this.gradeClass});

  factory Members.fromJson(Map<String, dynamic> json) =>
      _$MembersFromJson(json);

  Map<String, dynamic> toJson() => _$MembersToJson(this);
}
