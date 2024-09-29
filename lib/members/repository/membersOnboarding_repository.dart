// import 'package:flick_frontend/members/model/members_model.dart';
// import 'package:flick_frontend/members/repository/members_repository.dart';

// Future<void> sendMemberDataToServer() async {
//   Members members = Members(
//       type: UserType.STUDENT, nickname: '홍길동', school: null, gradeClass: null);
//   try {
//     final response = Members.fromJson(members.toJson());
//     print('서버에 온보딩 데이터 전송 성공 : $response');
//   } catch (err) {
//     print('서버에 온보딩 데이터 전송 실패 :$err');
//   }
// }
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
}
