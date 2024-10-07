import 'package:flick_frontend/members/model/memberInfo_model.dart';
import 'package:flick_frontend/members/provider/member_state.dart';
import 'package:flick_frontend/members/repository/memberProfile_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MembersProfileNotifier extends StateNotifier<MemberProfileState> {
  final MembersProfileRepository repository;

  MembersProfileNotifier(this.repository)
      : super(const MemberProfileState.initial());

  Future<void> fetchMemberInfo() async {
    state = const MemberProfileState.loading();
    try {
      await repository.fetchMemberInfo();
      final memberInfo = repository.memberInfo;
      if (memberInfo != null) {
        state = MemberProfileState.loaded(memberInfo);
      } else {
        state = const MemberProfileState.error("사용자 정보를 가져올 수 없습니다.");
      }
    } catch (e) {
      state = MemberProfileState.error(e.toString());
    }
  }

  Future<void> updateMemberInfo(MemberInfoModel updatedInfo) async {
    state = const MemberProfileState.loading();
    try {
      await repository.updateMemberInfo(updatedInfo);
      final memberInfo = repository.memberInfo;
      if (memberInfo != null) {
        state = MemberProfileState.loaded(memberInfo);
      } else {
        state = const MemberProfileState.error("사용자 정보를 업데이트할 수 없습니다.");
      }
    } catch (e) {
      state = MemberProfileState.error(e.toString());
    }
  }
}
