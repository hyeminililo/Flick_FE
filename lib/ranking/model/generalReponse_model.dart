import 'package:flick_frontend/members/model/memberInfo_model.dart';
import 'package:flick_frontend/ranking/model/pageInfo_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'generalReponse_model.g.dart';

@JsonSerializable()
class GeneralRankingResponse {
  final List<MemberInfo> memberInfoResDtos;
  final PageInfo pageInfoResDto;

  GeneralRankingResponse({
    required this.memberInfoResDtos,
    required this.pageInfoResDto,
  });

  factory GeneralRankingResponse.fromJson(Map<String, dynamic> json) =>
      _$GeneralRankingResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GeneralRankingResponseToJson(this);
}
