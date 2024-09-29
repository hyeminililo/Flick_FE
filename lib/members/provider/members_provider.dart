import 'package:flick_frontend/common/provider/dio_provider.dart';
import 'package:flick_frontend/members/model/members_model.dart';
import 'package:flick_frontend/members/repository/members_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// 멤버 상태 업데이트 하는 프로바이더
final membersProvider = StateNotifierProvider<MembersNotifier, Members>((ref) {
  return MembersNotifier();
});

class MembersNotifier extends StateNotifier<Members> {
  MembersNotifier()
      : super(Members(
            type: UserType.GENERAL, nickname: '', school: '', gradeClass: ''));
  void updateNickName(String nickname) {
    state = state.copyWith(nickname: nickname);
  }

  void updateSchool(String school) {
    state = state.copyWith(school: school);
  }

  void updateGradeClass(String gradeClass) {
    state = state.copyWith(gradeClass: gradeClass);
  }

  void updateType(UserType type) {
    state = state.copyWith(type: type);
  }
}

// final membersRepositoryProvider = Provider<MembersRepository>((ref) {
//   // final dio = ref.watch(dioProvider);
//   return MembersRepository(dio);
// });
