import 'package:flick_frontend/members/model/memberInfo_model.dart';
import 'package:flick_frontend/ranking/model/pageInfo_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'generalInfoResDto_model.g.dart';

//-> 일반 랭킹
@JsonSerializable()
class GeneralRankingInfoResDto {
  @JsonKey(name: 'memberInfoResDtos')
  final List<MemberInfoModel> memberInfoResDtos;
  final PageInfo pageInfoResDto;

  GeneralRankingInfoResDto({
    required this.memberInfoResDtos,
    required this.pageInfoResDto,
  });

  factory GeneralRankingInfoResDto.fromJson(Map<String, dynamic> json) =>
      _$GeneralRankingInfoResDtoFromJson(json);

  Map<String, dynamic> toJson() => _$GeneralRankingInfoResDtoToJson(this);
}
