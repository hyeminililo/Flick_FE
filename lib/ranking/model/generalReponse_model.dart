import 'package:json_annotation/json_annotation.dart';

part 'generalReponse_model.g.dart';

@JsonSerializable()
class GeneralRankingResponse {
  final int statusCode;
  final String message;
  final dynamic data;

  GeneralRankingResponse({
    required this.statusCode,
    required this.message,
    required this.data,
  });
  factory GeneralRankingResponse.fromJson(Map<String, dynamic> json) =>
      _$GeneralRankingResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GeneralRankingResponseToJson(this);
}
