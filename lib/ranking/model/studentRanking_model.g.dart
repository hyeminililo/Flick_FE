// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'studentRanking_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StudentRanking _$StudentRankingFromJson(Map<String, dynamic> json) =>
    StudentRanking(
      grade: (json['grade'] as num).toInt(),
      classNum: (json['classNum'] as num).toInt(),
      totalScore: (json['totalScore'] as num).toInt(),
    );

Map<String, dynamic> _$StudentRankingToJson(StudentRanking instance) =>
    <String, dynamic>{
      'grade': instance.grade,
      'classNum': instance.classNum,
      'totalScore': instance.totalScore,
    };
