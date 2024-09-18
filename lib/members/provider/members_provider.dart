import 'package:flick_frontend/members/model/members_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
