// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
// import 'package:flick_frontend/challenge/model/challengeInfo_model.dart';
// import 'package:flick_frontend/challenge/model/challenge_model.dart';
// import 'package:flick_frontend/challenge/repository/challenge_repository.dart';
// import 'package:flick_frontend/common/dio/apiResponse_model.dart';

// class ChallengeService {
//   final ChallengeRepository challengeRepository;
//   final FlutterSecureStorage storage;

//   ChallengeService(this.challengeRepository, this.storage);

//   // 전체 챌린지 리스트를 불러오는 메서드
//   Future<List<ChallengeInfo>> fetchChallengeList() async {
//     try {
//       final token = await storage.read(key: 'ACCESS_TOKEN_KEY');

//       // 토큰이 없는 경우 처리
//       if (token == null) {
//         print("[Error]: Token is null");
//         return []; // 빈 리스트 반환
//       }

//       final response = await challengeRepository.fetchChallenge(
//         authorization: 'Bearer $token',
//       );
//       print('Challenge Api : ${response.statusCode}');

//       // 상태 코드가 200이 아닌 경우 처리
//       if (response.statusCode != 200) {
//         print(
//             "[Error]: Failed to fetch challenges. StatusCode: ${response.statusCode}");
//         return [];
//       }

//       // 데이터가 null이 아닌 경우 Challenge 객체의 challengeInfo 리스트 반환
//       return response.data.challengeInfoResDtos ?? [];
//     } catch (e) {
//       print("[Challenge_fetch Error]: $e");
//       return []; // 오류 발생 시 빈 리스트 반환
//     }
//   }

//   // 단일 챌린지 상세 정보를 불러오는 메서드
//   Future<ChallengeInfo?> fetchChallengeDetails(int challengeId) async {
//     try {
//       final token = await storage.read(key: 'ACCESS_TOKEN_KEY');

//       // 토큰이 없는 경우 처리
//       if (token == null) {
//         print("[Error]: Token is null");
//         return null;
//       }

//       final response = await challengeRepository.fetchDetailsChallenge(
//         challengeId: challengeId,
//         authorization: 'Bearer $token',
//       );

//       print('ChallengeDetails Api : ${response.statusCode}');

//       // 상태 코드가 200이 아닌 경우 처리
//       if (response.statusCode != 200) {
//         print(
//             "[Error]: Failed to fetch challenge details. StatusCode: ${response.statusCode}");
//         return null;
//       }

//       // 데이터가 null이 아닌 경우 ChallengeInfo 객체 반환
//       return response.data;
//     } catch (e) {
//       print("[Error]: $e");
//       return null; // 오류 발생 시 null 반환
//     }
//   }
// }
