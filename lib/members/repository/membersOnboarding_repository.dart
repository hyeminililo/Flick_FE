import 'package:flick_frontend/members/model/members_model.dart';
import 'package:flick_frontend/members/repository/members_repository.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class MembersonboardingRepository {
  final MembersRepository membersRepository;
  final FlutterSecureStorage storage;

  MembersonboardingRepository(this.membersRepository, this.storage);

  Future<void> postMembers(Members member) async {
    final token = await storage.read(key: 'ACCESS_TOKEN_KEY'); // 액세스 토큰 읽기

    // Retrofit을 통해 회원 정보 전송
    await membersRepository.postMembers(member, authorization: 'Bearer $token');
  }

  Future<bool?> checkLogined() async {
    final token = await storage.read(key: 'ACCESS_TOKEN_KEY');

    final response =
        await membersRepository.checkFirstLogin(authorization: 'Bearer $token');

    try {
      if (response.statusCode == 200) {
        if (response.data.toString() == "true") {
          print('statusCode :200 ');
          // 서버 응답에서 데이터 추출
          return true; // 'data' 값 반환
        } else {
          // 오류 처리: 필요한 경우 false 반환 또는 예외 던지기
          return false;
        }
      }
    } catch (e) {
      print("서버 처리 과정 정보 err ");
    }
    return null;
  }
}
