import 'package:flick_frontend/members/model/memberInfo_model.dart';
import 'package:flick_frontend/ranking/model/generalInfoResDto_model.dart';
import 'package:flick_frontend/ranking/model/studentRanking_model.dart';
import 'package:flick_frontend/ranking/repository/ranking_repository.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class RankingService {
  final RankingRepository rankingRepository;
  final FlutterSecureStorage storage;

  RankingService(this.rankingRepository, this.storage);

  Future<List<MemberInfoModel>> fetchGeneralRankingList() async {
    try {
      final token = await storage.read(key: 'ACCESS_TOKEN_KEY');
      // 토큰이 null인 경우 처리
      if (token == null) {
        print("[Error]: Token is null");
        return []; // 빈 리스트 반환
      }
      final response = await rankingRepository.fetchGeneralRanking(
          authorization: 'Bearer $token');
      print('Ranking Api Status code : ${response.statusCode}');

      if (response.statusCode != 200) {
        print(
            "[Error]: Failed to fetch ranking. StatusCode: ${response.statusCode}");
        return []; // 빈 리스트 반환
      }

      final GeneralRankingInfoResDto rankingData = response.data;

      final List<MemberInfoModel> rankingList = rankingData.memberInfoResDtos;
      return rankingList; // null일 경우도 빈 리스트 반환할 필요가 없음
    } catch (e) {
      // 예외 처리 (네트워크 오류 등)
      print("[Error]: $e");
      return []; // 오류 발생 시 빈 리스트 반환
    }
  }

  // Future<List<StudentRanking>> fetchStudentRankingList() async {
  //   try {
  //     final token = await storage.read(key: 'ACCESS_TOKEN_KEY');
  //     // 토큰이 null인 경우 처리
  //     if (token == null) {
  //       print("[Error]: Token is null");
  //       return []; // 빈 리스트 반환
  //     }

  //     final response = await rankingRepository.fetchStudentRanking(
  //         authorization: 'Bearer $token');
  //     print('Ranking Api Status code : ${response.statusCode}');

  //     if (response.statusCode != 200) {
  //       print(
  //           "[Error]: Failed to fetch ranking. StatusCode: ${response.statusCode}");
  //       return []; // 빈 리스트 반환
  //     }

  //     // response.data가 Map 형식이라면, 'data' 키를 통해 리스트를 가져옵니다.
  //     final List<dynamic> data = response.data['data'];

  //     // 데이터를 StudentRanking 객체로 매핑하여 리스트로 반환합니다.
  //     final List<StudentRanking> rankingList = data.map((item) {
  //       return StudentRanking.fromJson(item as Map<String, dynamic>);
  //     }).toList();

  //     return rankingList;
  //   } catch (e) {
  //     // 예외 처리 (네트워크 오류 등)
  //     print("[Error]: $e");
  //     return []; // 오류 발생 시 빈 리스트 반환
  //   }
  // }
  Future<List<StudentRanking>> fetchStudentRankingList() async {
    try {
      final token = await storage.read(key: 'ACCESS_TOKEN_KEY');
      if (token == null) {
        print("[Error]: Token is null");
        return [];
      }

      final response = await rankingRepository.fetchStudentRanking(
          authorization: 'Bearer $token');
      print('Ranking Api Status code : ${response.statusCode}');

      if (response.statusCode != 200) {
        print(
            "[Error]: Failed to fetch ranking. StatusCode: ${response.statusCode}");
        return [];
      }
      List<StudentRanking> rankingList2 = response.data;
      // final Map<String, dynamic> data =
      //     response.data as Map<String, dynamic>; // JSON으로 캐스팅
      // final List<dynamic> studentData = data['data']; // 'data' 키에 접근

// 데이터를 StudentRanking 객체로 매핑하여 리스트로 반환
      // final List<StudentRanking> rankingList = studentData.map((item) {
      //   return StudentRanking.fromJson(item as Map<String, dynamic>);
      // }).toList();
      return rankingList2;
    } catch (e) {
      print("[Error]: $e");
      return [];
    }
  }
}
