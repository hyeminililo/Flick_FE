// ImageUrls 모델 - fetchChallengeImages에서 사용

import 'package:json_annotation/json_annotation.dart';

part 'images_model.g.dart';

@JsonSerializable()
class ImageUrls {
  final List<String> imageUrls;

  ImageUrls({required this.imageUrls});

  factory ImageUrls.fromJson(Map<String, dynamic> json) {
    // JSON에서 imageUrls를 가져옵니다.
    final urls = json['imageUrls'] ?? [];
    return ImageUrls(
      imageUrls: List<String>.from(urls),
    );
  }

  Map<String, dynamic> toJson() => _$ImageUrlsToJson(this);
}
