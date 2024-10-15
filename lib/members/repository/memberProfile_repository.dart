import 'dart:convert'; // JSON 인코딩을 위해 필요
import 'package:dio/dio.dart' as prefix;
import 'package:flick_frontend/common/dio/uri.dart';
import 'package:flick_frontend/members/model/memberInfo_model.dart';
import 'package:flick_frontend/members/repository/members_repository.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class MembersProfileRepository {
  final MembersRepository membersRepository;
  final FlutterSecureStorage storage;
  final dio = prefix.Dio();
  MemberInfoModel? memberInfo;

  MembersProfileRepository(this.membersRepository, this.storage);

  // 토큰 가져오는 메서드 분리
  Future<String> _getToken() async {
    final token = await storage.read(key: 'ACCESS_TOKEN_KEY');
    if (token == null) {
      throw Exception("토큰이 존재하지 않습니다.");
    }
    return token;
  }

  Future<void> fetchMemberInfo() async {
    final token = await _getToken();

    try {
      //api 연결 및 통신으로 정보 받기
      final apiResponse = await membersRepository.fetchMemberInfo(
          authorization: 'Bearer $token');
      if (apiResponse.statusCode == 200) {
        memberInfo = apiResponse.data;
      } else {
        throw Exception("예상치 못한 응답 코드: ${apiResponse.statusCode}");
      }
    } catch (e) {
      throw Exception("멤버 정보 가져오기 실패: $e");
    }
  }

  Future<void> updateMemberInfo(
      {required String nickname, String? imagePath}) async {
    final token = await _getToken();

    try {
      final formData = prefix.FormData.fromMap({
        "memberInfoUpdateReqDto": jsonEncode({"nickname": nickname}),
        if (imagePath != null)
          "multipartFile": await prefix.MultipartFile.fromFile(imagePath),
      });
      print('서버에 프로필 업데이트 요청을 보냅니다...');
      final apiResponse = await dio.patch("$BASE_URl/members/profile",
          data: formData,
          options: prefix.Options(headers: {
            'Authorization': 'Bearer $token',
          }));

      if (apiResponse.statusCode == 200) {
        print('프로필이 성공적으로 업데이트되었습니다.');
        print("응답 메시지: ${apiResponse.data}");
      } else {
        print('[Error_Member Update]: ${apiResponse.statusMessage}');
        print('응답 데이터: ${apiResponse.data}');
        throw Exception("프로필 업데이트 실패: ${apiResponse.statusMessage}");
      }
    } catch (e) {
      if (e is prefix.DioException) {
        print('에러 응답 데이터: ${e.response?.data}');
        print('에러 메시지: ${e.message}');
        if (e.response?.statusCode == 401) {
          // 토큰 만료 등의 인증 문제일 경우 추가 처리 (예: 로그아웃 처리 등)
          print('인증 오류: 다시 로그인해야 합니다.');
        }
      }
      throw Exception("멤버 정보 업데이트 실패: $e");
    }
  }
}
