import 'package:camera/camera.dart';
import 'package:dio/dio.dart';
import 'package:flick_frontend/challenge/model/challengeInfo_model.dart';
import 'package:flick_frontend/challenge/model/picture/images_model.dart';
import 'package:flick_frontend/challenge/model/picture/memberPictureUrls_model.dart';
import 'package:flick_frontend/challenge/repository/dio/challengeImageUpload_repository.dart';
import 'package:flick_frontend/challenge/repository/dio/challenge_repository.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

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

// 위에서 만든 챌린지의 length를 반환하는 로직
  Future<int?> fetchUserChallengeAuthImagesCount(
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
      int count = response.data.memberPictureUrls.length;
      if (response.statusCode == 200) {
        // ApiResponse 구조에서 data 부분만 MemberPictureUrls로 변환-> 이렇게 하면 이미 바꾼게 또 그런거라 생기는 거였음
        return count;
      } else {
        print("[Error]: Unexpected status code ${response.statusCode}");
        return null;
      }
    } catch (e) {
      print("[Error]: $e");
      return null;
    }
  }

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
