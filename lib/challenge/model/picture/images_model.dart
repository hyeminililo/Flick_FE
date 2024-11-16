// // import 'package:json_annotation/json_annotation.dart';

// // part 'images_model.g.dart';

// // @JsonSerializable()
// // class ImageUrls {
// //   final List<int> imageIds;
// //   final List<String> imageUrls;

// //   ImageUrls({required this.imageIds, required this.imageUrls});

// //   factory ImageUrls.fromJson(Map<String, dynamic> json) {
// //     // 'data' 키 아래의 데이터를 가져와 필드에 매핑
// //     final data = json['data'] ?? {};
// //     return ImageUrls(
// //       imageIds: List<int>.from(data['imageIds'] ?? []),
// //       imageUrls: List<String>.from(data['imageUrls'] ?? []),
// //     );
// //   }

// //   Map<String, dynamic> toJson() => _$ImageUrlsToJson(this);
// // }
// import 'package:json_annotation/json_annotation.dart';

// part 'images_model.g.dart';

// @JsonSerializable()
// class ImageUrls {
//   final List<int> imageIds;
//   final List<String> imageUrls;

//   ImageUrls({required this.imageIds, required this.imageUrls});

//   factory ImageUrls.fromJson(Map<String, dynamic> json) =>
//       _$ImageUrlsFromJson(json);

//   Map<String, dynamic> toJson() => _$ImageUrlsToJson(this);
// }
class ImageUrls {
  final List<String> imageUrls;
  final List<int> imageIds;

  ImageUrls({required this.imageUrls, required this.imageIds});

  factory ImageUrls.fromJson(Map<String, dynamic> json) {
    final data = json['data']; // 'data' 키에서 실제 데이터를 추출
    if (data is Map<String, dynamic>) {
      return ImageUrls(
        imageUrls: List<String>.from(data['imageUrls']),
        imageIds: List<int>.from(data['imageIds']),
      );
    } else {
      throw Exception("Unexpected JSON format: $data");
    }
  }
}
