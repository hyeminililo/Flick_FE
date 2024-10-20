import 'dart:convert';
import 'dart:io';
import 'package:http_parser/http_parser.dart'; // MediaType 사용을 위해 임포트
import 'package:dio/dio.dart' as prefix;
import 'package:dio/dio.dart';
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
        authorization: 'Bearer $token',
      );

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
      MemberInfoModel memberInfo, File? imageFile) async {
    Dio dio = Dio();
    final token = await storage.read(key: 'ACCESS_TOKEN_KEY');

    if (token == null) {
      print("[Error]: Token is null");
      return;
    }

    try {
      // FormData 생성
      FormData formData = FormData.fromMap({
        // JSON 문자열을 추가
        'memberInfoUpdateReqDto': MultipartFile.fromString(
          jsonEncode({
            'nickname': memberInfo.nickname,
          }),
          contentType: MediaType('application', 'json'), // MediaType 사용
        ),
        // 이미지 파일 추가
        'multipartFile': imageFile != null
            ? await MultipartFile.fromFile(
                imageFile.path,
                filename: 'profile_image.jpg',
              )
            : null,
      });

      // 서버 요청
      final response = await dio.patch(
        '$BASE_URl/members/profile',
        data: formData,
        options: prefix.Options(headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'multipart/form-data',
        }),
      );

      if (response.statusCode == 200) {
        final apiResponse = ApiResponse<MemberInfoModel>.fromJson(
          response.data,
          (json) => MemberInfoModel.fromJson(json as Map<String, dynamic>),
        );

        memberInfo = apiResponse.data;
      } else {
        print(Error());
        throw Exception("사용자 정보를 업데이트하는 중 문제가 발생했습니다.");
      }
    } catch (e) {
      print("patch 후 데이터 안 받아짐: $e");
      throw Exception("사용자 정보 업데이트 중 오류 발생: $e");
    }
  }
}
