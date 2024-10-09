import 'package:flick_frontend/members/model/memberInfo_model.dart';
import 'package:flick_frontend/members/model/members_model.dart';
import 'package:flick_frontend/members/provider/member_state.dart';
import 'package:flick_frontend/members/provider/members_provider.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'badgeWidget.dart';
import 'editMyProfile.dart'; // EditMyProfile 페이지 import

class MyPageScreen2 extends ConsumerWidget {
  const MyPageScreen2({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // membersProfileNotifierProvider의 현재 상태를 감시하여 받아옴
    final profileState = ref.watch(membersProfileNotifierProvider);

    // 상태 변화 감지 리스너 설정: 에러 상태일 때 스낵바로 에러 메시지 출력
    ref.listen<MemberProfileState>(membersProfileNotifierProvider,
        (previous, next) {
      next.maybeWhen(
        error: (message) {
          // 에러 상태 발생 시, 스낵바로 메시지 표시
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(message)),
          );
        },
        orElse: () {},
      );
    });

    // 프로필 데이터 가져오기
    //final profileData = ref.watch(membersProfileNotifierProvider);

    // 화면 크기 가져오기
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text('마이페이지'), // 상단 바 제목 설정
      ),
      body: Center(
        child: _buildContent(
            profileState, screenHeight, screenWidth, context, ref),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // 플로팅 버튼을 눌렀을 때 사용자 정보를 업데이트하는 로직
          final updatedInfo = MemberInfoModel(
            id: 1,
            email: 'newemail@example.com',
            nickname: '안녕',
            // 기타 필드 초기화
            picture: null,
            school: null,
            gradeClass: null,
            type: UserType.GENERAL,
            score: null,
            ecoLifeDuration: null,
            recentChallengeTitle: null,
            totalActionCount: null,
          );

          // 상태 관리 객체를 통해 정보 업데이트
          // 이전 상태가 로딩 중일 경우 업데이트 중복 방지
          if (profileState is! MemberProfileLoading) {
            ref
                .read(membersProfileNotifierProvider.notifier)
                .updateMemberInfo(updatedInfo);
          }
        },
        child: const Icon(Icons.update), // 버튼 아이콘 설정
      ),
    );
  }

  Widget _buildContent(
      MemberProfileState state,
      // ProfileData profileData,
      double screenWidth,
      double screenHeight,
      BuildContext context,
      WidgetRef ref) {
    return state.when(
      initial: () {
        // 초기 상태에서 데이터를 불러옴
        Future.microtask(() => ref
            .read(membersProfileNotifierProvider.notifier)
            .fetchMemberInfo());
        return const CircularProgressIndicator();
      },
      loading: () => const CircularProgressIndicator(),
      loaded: (memberInfo) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              SizedBox(height: screenHeight * 0.05),
              // 프로필 이미지와 이름
              GestureDetector(
                onTap: () {
                  // 아바타 클릭 시 EditMyProfile 페이지로 이동
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EditMyProfile(
                        profileImage: memberInfo.picture!,
                      ),
                    ),
                  );
                },
                child: CircleAvatar(
                  radius: 80,
                  backgroundImage: memberInfo.picture != null
                      ? NetworkImage(memberInfo.picture!)
                      : const AssetImage("assets/images/flick.png"), // 기본 이미지
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
              Text(
                memberInfo.nickname,
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: screenHeight * 0.04),
              // 세 개의 통계 컨테이너
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildStatCard(
                      Icons.calendar_today,
                      '${memberInfo.ecoLifeDuration.toString()}일째',
                      '진행중',
                      screenWidth),
                  _buildStatCard(
                      Icons.event_available,
                      memberInfo.recentChallengeTitle!,
                      '최근 실천 챌린지',
                      screenWidth),
                  _buildStatCard(
                      Icons.access_time,
                      "${memberInfo.totalActionCount}번",
                      '누적 실천 횟수',
                      screenWidth),
                ],
              ),
              const SizedBox(height: 20),
              // 뱃지 섹션
              BadgeWidget(count: memberInfo.score),
              //프로바이더에서 가져온 뱃지 값 전달
            ],
          ),
        );
      },
      error: (message) => Text('오류: $message'),
    );
  }

  Widget _buildStatCard(
      IconData icon, String stat, String description, double screenWidth) {
    final double height = screenWidth * 0.16; // 너비의 40%를 카드 높이로 설정

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 2,
      child: SizedBox(
        width: screenWidth * 0.12, // 고정된 너비
        height: height, // MediaQuery를 통한 동적 높이
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // 중앙 정렬
            children: [
              Icon(icon, size: 30, color: Colors.grey[700]),
              const SizedBox(height: 10),
              Text(
                stat,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                description,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey[600],
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
