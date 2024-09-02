import 'package:json_annotation/json_annotation.dart';

part 'members_model.g.dart';

enum UserType { STUDENT, GENERAL }

@JsonSerializable()
class Members_Model {
  UserType type;
  String nickname;
  String school;
  String gradeClass;

  Members_Model(
      {required this.type,
      required this.nickname,
      required this.school,
      required this.gradeClass});

  factory Members_Model.fromJson(Map<String, dynamic> json) =>
      _$Members_ModelFromJson(json);

  Map<String, dynamic> toJson() => _$Members_ModelToJson(this);
}
