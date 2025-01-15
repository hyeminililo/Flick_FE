import 'package:json_annotation/json_annotation.dart';

part 'pageInfo_model.g.dart';

@JsonSerializable()
class PageInfo {
  final int currentPage;
  final int totalPages;
  final int totalItems;

  PageInfo(
      {required this.currentPage,
      required this.totalPages,
      required this.totalItems});

  factory PageInfo.fromJson(Map<String, dynamic> json) =>
      _$PageInfoFromJson(json);
  Map<String, dynamic> toJson() => _$PageInfoToJson(this);
}
