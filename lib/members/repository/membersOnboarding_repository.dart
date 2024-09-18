import 'package:flick_frontend/members/model/members_model.dart';
import 'package:flick_frontend/members/repository/members_repository.dart';

Future<void> sendDataToServer() async {
  Members members = Members(
      type: UserType.STUDENT, nickname: '홍길동', school: null, gradeClass: null);
  try {
    final response = Members.fromJson(members.toJson());
    print('서버에 온보딩 데이터 전송 성공 : $response');
  } catch (err) {
    print('서버에 온보딩 데이터 전송 실패 :$err');
  }
}
