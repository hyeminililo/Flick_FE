import 'package:dio/dio.dart';
import 'package:flick_frontend/challenge/model/challengeInfo_model.dart';
import 'package:flick_frontend/challenge/model/challenge_model.dart';
import 'package:flick_frontend/challenge/repository/dio/challengeReports_repository.dart';
import 'package:flick_frontend/challenge/repository/dio/challenge_repository.dart';
import 'package:flick_frontend/members/model/members_model.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

// 오픈 챌린지에 대한 서비스 및 프로바이더 연관 아 오픈이 아니어도 적을까 ? 그건 약간 고민
class ChallengeService {
  final ChallengeRepository challengeRepository;
  final ChallengeReportsRepository challengeReportsRepo;
  final FlutterSecureStorage storage;

  ChallengeService(
      this.challengeRepository, this.storage, this.challengeReportsRepo);
// 오픈 챌린지 전체조회하는 것
  Future<List<ChallengeInfo>> fetchOpenChallengeList() async {
    try {
      final token = await storage.read(key: 'ACCESS_TOKEN_KEY');

      // 토큰이 null인 경우 처리
      if (token == null) {
        print("[Error]: Token is null");
        return [];
      }
      final response = await challengeRepository.fetchOpenChallenge(
          authorization: 'Bearer $token');
      print('openChallenge Api : ${response.statusCode} ');
      if (response.statusCode != 200) {
        print(
            "[Error]: Failed to fetch challenge. StatusCode: ${response.statusCode}");
        return [];
      }
      // data 안에 type과 같이 있으니까 구별해야함 -> news는 null로 했는데
      final challenge = response.data;
      final challengeList = challenge.challengeInfoResDtos;

      return challengeList ?? [];
    } catch (e) {
      // 예외 처리 (네트워크 오류 등)
      print("[Error]: $e");
      return []; // 오류 발생 시 빈 뉴스 리스트 반환
    }
  }

// 나의 챌린지 조회
  Future<List<ChallengeInfo>> fetchMyChallenge() async {
    try {
      final token = await storage.read(key: 'ACCESS_TOKEN_KEY');

      if (token == null) {
        print("[Error]: Token is null");
        return [];
      }

      final response = await challengeRepository.fetchMyChallenge(
          authorization: 'Bearer $token');
      print('MyChallenge Api : ${response.statusCode} ');
      if (response.statusCode != 200) {
        print(
            "[Error]: Failed to fetch challenge. StatusCode: ${response.statusCode}");
        return [];
      }
      final challenge = response.data;
      final challengeList = challenge.challengeInfoResDtos;
      return challengeList ?? [];
    } catch (e) {
      // 예외 처리 (네트워크 오류 등)
      print("[Error]: $e");
      return []; // 오류 발생 시 빈 뉴스 리스트 반환
    }
  }

  // 타입 관리
  Future<UserType?> devideType() async {
    try {
      final token = await storage.read(key: 'ACCESS_TOKEN_KEY');

      if (token == null) {
        print("[Error]: Token is null");
      }

      final response = await challengeRepository.fetchMyChallenge(
          authorization: 'Bearer $token');
      print('MyChallenge Api : ${response.statusCode} ');
      if (response.statusCode != 200) {
        print(
            "[Error]: Failed to fetch challenge. StatusCode: ${response.statusCode}");
      }
      final challenge = response.data;
      final userType = challenge.type;
      return userType;
    } catch (e) {
      // 예외 처리 (네트워크 오류 등)
      print("[Error]: $e");
      // 오류 발생 시 빈 뉴스 리스트 반환
    }
    return null;
  }

  // 챌린지 참여
  Future<void> joinChallenge(int challengeId) async {
    try {
      final token = await storage.read(key: 'ACCESS_TOKEN_KEY');

      if (token == null) {
        print("[Error]: Token is null");
      }
      final response = await challengeRepository.joinChallenge(
        challengeId: challengeId,
        authorization: 'Bearer $token',
      );
      print(response.statusCode);

      if (response.statusCode == 200) {
        print("challenge 참여  성공");
      }
    } catch (e) {
      // 예외 처리 (네트워크 오류 등)
      print("[Error]: $e");
    }
  }

// 챌린지 탈퇴
  Future<void> deleteChallenge(int challengeId) async {
    try {
      final token = await storage.read(key: 'ACCESS_TOKEN_KEY');

      if (token == null) {
        print("[Error]: Token is null");
      }
      final response = await challengeRepository.leaveChallenge(
        challengeId: challengeId,
        authorization: 'Bearer $token',
      );
      if (response.statusCode == 200) {
        print("challenge 참여  성공");
      }
    } catch (e) {
      // 예외 처리 (네트워크 오류 등)
      print("[Error]: $e");
    }
  }

// 챌린지 신고
  Future<void> reportsImage(int imageId) async {
    try {
      final token = await storage.read(key: 'ACCESS_TOKEN_KEY');

      if (token == null) {
        print("[Error]: Token is null");
      }
      final response = await challengeReportsRepo.reportsChallenge(
        imageId: imageId,
        authorization: 'Bearer $token',
      );
      if (response.statusCode == 200) {
        print("challenge 신고 성공");
      }
    } catch (e) {
      print("[Error]: $e");
    }
  }
}
