import 'package:json_annotation/json_annotation.dart';
part 'studentRanking_model.g.dart';

@JsonSerializable()
class StudentRanking {
  final int grade;
  final int classNum;
  final int totalScore;

  StudentRanking({
    required this.grade,
    required this.classNum,
    required this.totalScore,
  });
  factory StudentRanking.fromJson(Map<String, dynamic> json) =>
      _$StudentRankingFromJson(json);

  Map<String, dynamic> toJson() => _$StudentRankingToJson(this);
}
