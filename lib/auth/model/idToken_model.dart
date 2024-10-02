import 'package:json_annotation/json_annotation.dart';

part 'idToken_model.g.dart';

@JsonSerializable()
class IdTokenModel {
  String idToken;
  IdTokenModel({required this.idToken});

  factory IdTokenModel.fromJson(Map<String, dynamic> json) =>
      _$IdTokenModelFromJson(json);
  Map<String, dynamic> toJson() => _$IdTokenModelToJson(this);
}
