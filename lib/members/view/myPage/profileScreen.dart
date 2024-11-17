import 'package:flick_frontend/members/provider/member_state.dart';
import 'package:flick_frontend/members/provider/members_provider.dart';
import 'package:flick_frontend/members/view/myPage/editProfileScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'badgeWidget.dart';

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
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(message)),
          );
        },
        orElse: () {},
      );
    });

    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text('마이페이지'),
      ),
      body: Center(
        child: _buildContent(
            profileState, screenHeight, screenWidth, context, ref),
      ),
    );
  }

  Widget _buildContent(MemberProfileState state, double screenWidth,
      double screenHeight, BuildContext context, WidgetRef ref) {
    return state.when(
      initial: () {
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
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EditProfileScreen(
                        profileImage:
                            memberInfo.picture ?? "assets/images/flick.png",
                      ),
                    ),
                  );
                },
                child: CircleAvatar(
                  radius: 80,
                  backgroundImage: memberInfo.picture != null
                      ? NetworkImage(memberInfo.picture!)
                      : const AssetImage("assets/images/flick.png"),
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
                      memberInfo.recentChallengeTitle ?? '없음',
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
              BadgeWidget(count: memberInfo.score),
            ],
          ),
        );
      },
      error: (message) => Text('오류: $message'),
    );
  }

  Widget _buildStatCard(
      IconData icon, String stat, String description, double screenWidth) {
    final double height = screenWidth * 0.16;

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 2,
      child: SizedBox(
        width: screenWidth * 0.12,
        height: height,
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
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
