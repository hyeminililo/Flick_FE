import 'package:flick_frontend/challenge/model/challengeInfo_model.dart';
import 'package:flick_frontend/challenge/model/picture/images_model.dart';
import 'package:flick_frontend/challenge/model/picture/memberPictureUrls_model.dart';
import 'package:flick_frontend/challenge/repository/challenge_repository.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class ChallengeDetailsService {
  final ChallengeRepository challengeRepository;
  final FlutterSecureStorage storage;

  ChallengeDetailsService(this.challengeRepository, this.storage);

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
      print("[Error]: $e");
    }
    return null;
  }

// 이거 나중에 바꾸든지원래 <MemberPictureUrls>엿음
  Future<MemberPictureUrls?> fetchUserChallengeAuthImages(
      int challengeId, int month, int day) async {
    try {
      final token = await storage.read(key: 'ACCESS_TOKEN_KEY');

      if (token == null) {
        print("[Error]: Token is null");
      }

      final response = await challengeRepository.fetchUserChallengeAuthImages(
          challengeId: challengeId, month: month, day: day);
      final userTogetherImages = response.data;
      return userTogetherImages;
    } catch (e) {
      print(e);
    }
    return null;
  }

// ?이 안될수도 ~
  Future<ImageUrls?> fetchChallengeImages(
      int challengeId, int month, int day) async {
    try {
      final token = await storage.read(key: 'ACCESS_TOKEN_KEY');

      if (token == null) {
        print("[Error]: Token is null");
      }
      final response = await challengeRepository.fetchChallengeImages(
          challengeId: challengeId, month: month, day: day);

      final imageUrls = response.data;
      return imageUrls;
    } catch (e) {
      print(e);
    }
    return null;
  }
}
