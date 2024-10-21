import 'dart:io';

import 'package:flick_frontend/members/model/memberInfo_model.dart';
import 'package:flick_frontend/members/provider/member_state.dart';
import 'package:flick_frontend/members/provider/members_provider.dart';
import 'package:flick_frontend/members/repository/memberProfile_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MembersProfileNotifier extends StateNotifier<MemberProfileState> {
  final MembersProfileRepository repository;
  MembersProfileNotifier(this.repository)
      : super(const MemberProfileState.initial());

  Future<void> fetchMemberInfo() async {
    // 이미 로딩 중일 경우 중복 로딩 방지
    if (state is MemberProfileLoading) return;

    state = const MemberProfileState.loading();
    try {
      // memberProfileRp의 페치 불러옴
      // memberProfileRp의 페치 불러옴
      await repository.fetchMemberInfo();
// 거기서 업데이트 한 멤버 정보를 받아서 저장 함.
// 거기서 업데이트 한 멤버 정보를 받아서 저장 함.
      final memberInfo = repository.memberInfo;
      if (memberInfo != null) {
        state = MemberProfileState.loaded(memberInfo);
      } else {
        state = const MemberProfileState.error("사용자 정보를 가져올 수 없습니다.");
      }
    } catch (e) {
      state = const MemberProfileState.error("데이터를 가져오는 중 오류가 발생했습니다.");
    }
  }

  // 멤버 정보 업데이트 (닉네임과 프로필 사진만 업데이트)
  Future<void> updateMemberInfo(String nickname, File? newProfileImage) async {
    if (state is MemberProfileLoading) return; // 중복 업데이트 방지

    state = const MemberProfileState.loading();

    try {
      // 현재 멤버 정보 가져오기
      final currentMemberInfo = repository.memberInfo;
      if (currentMemberInfo == null) {
        throw Exception("멤버 정보를 찾을 수 없습니다.");
      }

      // 닉네임 및 사진 수정 (copyWith 사용)
      final updatedMemberInfo = currentMemberInfo.copyWith(
        nickname: nickname, // 새로운 닉네임으로 수정
        picture: newProfileImage != null
            ? newProfileImage.path
            : currentMemberInfo.picture, // 프로필 사진 수정, 없으면 기존 사진 유지
      );

      // 서버에 업데이트 요청
      await repository.updateMemberInfo(updatedMemberInfo, newProfileImage);
      await repository.fetchMemberInfo();
      // 업데이트 후 새로운 상태 반영
      final updatedInfo = repository.memberInfo;
      state = MemberProfileState.loaded(updatedInfo!);
    } catch (e) {
      state = const MemberProfileState.error("사용자 정보 업데이트 중 오류가 발생했습니다.");
    }
  }
}
