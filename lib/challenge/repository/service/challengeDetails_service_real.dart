import 'dart:convert';
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:dio/dio.dart';
import 'package:flick_frontend/challenge/model/challengeInfo_model.dart';
import 'package:flick_frontend/challenge/model/picture/images_model.dart';
import 'package:flick_frontend/challenge/model/picture/memberPictureUrls_model.dart';
import 'package:flick_frontend/challenge/provider/provs/challengeDetails_provider.dart';
import 'package:flick_frontend/challenge/repository/dio/challengeImageUpload_repository.dart';
import 'package:flick_frontend/challenge/repository/dio/challenge_repository.dart';
import 'package:flick_frontend/common/dio/apiResponse_model.dart';
import 'package:flick_frontend/common/dio/uri.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http_parser/http_parser.dart';

class ChallengeDetailsService {
  final ChallengeRepository challengeRepository;
  final FlutterSecureStorage storage;
  final ChallengeImageUploadRepository imageUploadRepository;

  ChallengeDetailsService(
      this.challengeRepository, this.storage, this.imageUploadRepository);

  Future<ChallengeInfo?> fetchOpenDtails(int challengeId) async {
    try {
      final token = await storage.read(key: 'ACCESS_TOKEN_KEY');
      if (token == null) {
        print("[Error]: Token is null");
      }

      final response = await challengeRepository.fetchDetailsChallenge(
        challengeId: challengeId,
        authorization: 'Bearer $token',
      );
      print('ChallengeDetails Api : ${response.statusCode}');

      if (response.statusCode != 200) {
        print(
            "[Error]: Failed to fetch challengeDetails. StatusCode: ${response.statusCode}");
      }

      final ChallengeInfo challengeInfo = response.data;
      return challengeInfo;
    } catch (e) {
      print("[Error]: {detailService} $e");
    }
    return null;
  }

// // 이거 나중에 바꾸든지원래 <MemberPictureUrls>엿음
//   Future<MemberPictureUrls?> fetchUserChallengeAuthImages(
//       int challengeId, int month, int day) async {
//     try {
//       final token = await storage.read(key: 'ACCESS_TOKEN_KEY');

//       if (token == null) {
//         print("[Error]: Token is null");
//       }

//       final response = await challengeRepository.fetchUserChallengeAuthImages(
//           challengeId: challengeId, month: month, day: day);
//       final userTogetherImages = response.data;
//       return userTogetherImages;
//     } catch (e) {
//       print(e);
//     }
//     return null;
//   }
  // Future<MemberPictureUrls?> fetchUserChallengeAuthImages(
  //     int challengeId, int month, int day) async {
  //   try {
  //     final token = await storage.read(key: 'ACCESS_TOKEN_KEY');
  //     if (token == null) {
  //       print("[Error]: Token is null");
  //       return null;
  //     }

  //     final response = await challengeRepository.fetchUserChallengeAuthImages(
  //       challengeId: challengeId,
  //       month: month,
  //       day: day,
  //       authorization: 'Bearer $token',
  //     );

  //     if (response.statusCode == 200) {
  //       // JSON 데이터를 MemberPictureUrls 객체로 변환
  //       return MemberPictureUrls.fromJson(response.data);
  //     } else {
  //       print("[Error]: Unexpected status code ${response.statusCode}");
  //       return null;
  //     }
  //   } catch (e) {
  //     print("[Error]: $e");
  //     return null;
  //   }
  // }
  Future<MemberPictureUrls?> fetchUserChallengeAuthImages(
      int challengeId, int month, int day) async {
    try {
      final token = await storage.read(key: 'ACCESS_TOKEN_KEY');
      if (token == null) {
        print("[Error]: Token is null");
        return null;
      }

      // API 호출
      final response = await challengeRepository.fetchUserChallengeAuthImages(
        challengeId: challengeId,
        month: month,
        day: day,
        authorization: 'Bearer $token',
      );
      print(response.data.memberPictureUrls);
      if (response.statusCode == 200) {
        // ApiResponse 구조에서 data 부분만 MemberPictureUrls로 변환-> 이렇게 하면 이미 바꾼게 또 그런거라 생기는 거였음
        return response.data;
      } else {
        print("[Error]: Unexpected status code ${response.statusCode}");
        return null;
      }
    } catch (e) {
      print("[Error]: $e");
      return null;
    }
  }

// // ?이 안될수도 ~
//   Future<ImageUrls?> fetchChallengeImages(
//       int challengeId, int month, int day) async {
//     try {
//       final token = await storage.read(key: 'ACCESS_TOKEN_KEY');

//       if (token == null) {
//         print("[Error]: Token is null");
//       }
//       final response = await challengeRepository.fetchChallengeImages(
//           challengeId: challengeId, month: month, day: day);

//       final imageUrls = response.data;
//       return imageUrls;
//     } catch (e) {
//       print(e);
//     }
//     return null;
//   }
  // Future<ImageUrls?> fetchChallengeImages(
  //     int challengeId, int month, int day) async {
  //   try {
  //     final token = await storage.read(key: 'ACCESS_TOKEN_KEY');

  //     if (token == null) {
  //       print("[Error]: Token is null");
  //       return null;
  //     }

  //     final response = await challengeRepository.fetchChallengeImages(
  //         challengeId: challengeId, month: month, day: day);

  //     // JSON을 ImageUrls 객체로 변환
  //     final imageUrls = ImageUrls.fromJson(response.data);
  //     return imageUrls;
  //   } catch (e) {
  //     print("[Error]: $e");
  //     return null;
  //   }
  // }
  // Future<ImageUrls?> fetchChallengeImages(
  //     int challengeId, int month, int day) async {
  //   try {
  //     final token = await storage.read(key: 'ACCESS_TOKEN_KEY');

  //     if (token == null) {
  //       print("[Error]: Token is null - 사용자에게 재로그인을 유도합니다.");
  //       return null;
  //     }

  //     print("======");
  //     print('Challenge ID: $challengeId');
  //     print('Month: $month');
  //     print('Day: $day');
  //     print("Bearer Token: Bearer $token");

  //     // Challenge images 요청
  //     final response = await challengeRepository.fetchChallengeImages(
  //       challengeId: challengeId,
  //       month: month,
  //       day: day,
  //       authorization: 'Bearer $token',
  //     );

  //     print("Response Data: ${response.data}");
  //     print("Response Status Code: ${response.statusCode}");
  //     print("Response Message: ${response.message}");

  //     // 'data' 필드를 확인하여 Map 형태로 변환 후 처리
  //     if (response.data is Map<String, dynamic>) {
  //       final data = response.data['data'] as Map<String, dynamic>;
  //       final imageUrls = ImageUrls.fromJson(data);
  //       return imageUrls;
  //     } else {
  //       print("[Error]: response.data is not in expected format.");
  //       return null;
  //     }
  //   } catch (e) {
  //     print("챌린지 인증 이미지 관련 오류[Error]: $e");
  //     return null;
  //   }
  // }
//   Future<List<String>> fetchChallengeImages(
//       int challengeId, int month, int day) async {
//     try {
//       final token = await storage.read(key: 'ACCESS_TOKEN_KEY');

//       if (token == null) {
//         print("[Error]: Token is null - 사용자에게 재로그인을 유도합니다.");
//         return [];
//       }
//       print(
//           "Fetching images for Challenge ID: $challengeId, Month: $month, Day: $day");

//       final response = await challengeRepository.fetchChallengeImages(
//         challengeId: challengeId,
//         month: month,
//         day: day,
//         authorization: 'Bearer $token',
//       );
//       print("Response Data: ${response.statusCode}");
//       print("Response Data: ${response.data}");
//       print("Response Data: ${response.data.imageIds}");
//       print("Response Data: ${response.data.imageUrls}");
// //요부분변환ㅍ
//       // return response.data;
//       return response.data.imageUrls;
//     } catch (e) {
//       print("챌린지 인증 이미지 관련 오류[Error]: $e");
//       return [];
//     }
//   }
  // Future<ImageUrls?> fetchChallengeImages(
  //     int challengeId, int month, int day) async {
  //   try {
  //     final token = await storage.read(key: 'ACCESS_TOKEN_KEY');
  //     if (token == null) {
  //       print("[Error]: Token is null - 사용자에게 재로그인을 유도합니다.");
  //       return null;
  //     }

  //     print(
  //         "Fetching images for Challenge ID: $challengeId, Month: $month, Day: $day");

  //     final response = await challengeRepository.fetchChallengeImages(
  //       challengeId: challengeId,
  //       month: month,
  //       day: day,
  //       authorization: 'Bearer $token',
  //     );

  //     print("Response Status Code: ${response.statusCode}");
  //     print("Raw Response Data: ${response.data}");

  //     if (response.statusCode == 200) {
  //       // JSON 데이터를 ImageUrls 객체로 변환
  //       if (response.data is Map<String, dynamic>) {
  //         final imageUrls = ImageUrls.fromJson(response.data);
  //         print("Parsed ImageUrls: ${imageUrls.imageUrls}");
  //         return imageUrls; // ImageUrls 객체 반환
  //       } else {
  //         print("[Error]: Response data is not in expected format.");
  //         return null;
  //       }
  //     } else {
  //       print("[Error]: API가 올바르지 않은 상태 코드를 반환했거나 데이터가 비었습니다.");
  //       return null;
  //     }
  //   } catch (e) {
  //     print("[Error]: 예외 발생 - $e");
  //     return null;
  //   }
  // }

  Future<ImageUrls?> fetchChallengeImages(
      int challengeId, int month, int day) async {
    try {
      final token = await storage.read(key: 'ACCESS_TOKEN_KEY');
      if (token == null) {
        print("[Error]: Token is null - 사용자에게 재로그인을 유도합니다.");
        return null;
      }

      print(
          "Fetching images for Challenge ID: $challengeId, Month: $month, Day: $day");

      // API 호출
      final response = await challengeRepository.fetchChallengeImages(
        challengeId: challengeId,
        month: month,
        day: day,
        authorization: 'Bearer $token',
      );

      print("Response Status Code: ${response.statusCode}");
      print("Response Data: ${response.data}");

      // response.data가 이미 ImageUrls 타입인 경우 바로 반환
      if (response.statusCode == 200) {
        final imageUrls = response.data;
        print("Received ImageUrls: ${imageUrls.imageUrls}");
        return imageUrls;
      } else {
        print("[Error]: API returned unexpected status or data type.");
        return null;
      }
    } catch (e, stackTrace) {
      print("[Error]: Exception occurred - $e");
      print("StackTrace: $stackTrace");
      return null;
    }
  }

  Future<List<ImageUrls>?> uploadChallengeImages({
    required int challengeId,
    required int month, // 추가된 부분
    required int day, // 추가된 부분
    required List<XFile> imageFiles,
  }) async {
    try {
      // 토큰을 읽어와서 인증 헤더로 설정
      final token = await storage.read(key: 'ACCESS_TOKEN_KEY');
      if (token == null) {
        print("[Error]: Token is null");
        return null;
      }

      // XFile을 MultipartFile로 변환하여 List 생성
      List<MultipartFile> multipartFiles = await Future.wait(
        imageFiles.map((file) async =>
            MultipartFile.fromFile(file.path, filename: file.name)),
      );

      // 이미지 업로드 API 호출 - month, day 파라미터 추가
      final response = await imageUploadRepository.uploadChallengeImages(
        challengeId: challengeId,
        month: month, // 추가된 부분
        day: day, // 추가된 부분
        authorization: 'Bearer $token',
        files: multipartFiles,
      );
      print("======");
      print(response.data);
      print(response.statusCode);
      print("Image Upload Status Code : ${response.statusCode}");
      return response.data;
    } on DioException catch (e) {
      print(
          "[Error]: Image upload failed - Status Code: ${e.response?.statusCode}");
      print("[Error]: DioException Data - ${e.response?.data}");
      return null;
    } catch (e) {
      print("[Error]: Unexpected error - $e");
      return null;
    }
  }
}
