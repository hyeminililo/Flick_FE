import 'package:json_annotation/json_annotation.dart';

part 'images_model.g.dart';

@JsonSerializable()
class ImageUrls {
  final List<String> imageUrls;
  final List<int> imageIds;

  ImageUrls({required this.imageUrls, required this.imageIds});

  // 자동 생성된 fromJson 메서드
  factory ImageUrls.fromJson(Map<String, dynamic> json) =>
      _$ImageUrlsFromJson(json);

  // 자동 생성된 toJson 메서드
  Map<String, dynamic> toJson() => _$ImageUrlsToJson(this);
}
