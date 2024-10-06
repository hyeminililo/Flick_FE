import '../provider/profile_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'badgeWidget.dart';
import 'allBadgePage.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 프로바이더에서 프로필 데이터 가져오기
    final profileData = ref.watch(profileProvider); // 수정된 부분

    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xffE2E2E2),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(height: screenHeight * 0.05),
            // 프로필 이미지와 이름
            const CircleAvatar(
              radius: 80,
              backgroundImage:
                  AssetImage('assets/images/google.png'), // 테스트용 asset 이미지 경로
            ),
            SizedBox(height: screenHeight * 0.02),
            Text(
              profileData.name, // 프로필 이름
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: screenHeight * 0.05),

            // 세 개의 통계 컨테이너
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildStatCard(Icons.calendar_today, profileData.stat1, '진행중',
                    screenWidth),
                _buildStatCard(Icons.event_available, profileData.stat2,
                    '최근 실천 챌린지', screenWidth),
                _buildStatCard(Icons.access_time, profileData.stat3, '누적 실천 횟수',
                    screenWidth),
              ],
            ),
            const SizedBox(height: 20),

            // 뱃지 섹션
            BadgeWidget(
                badgeCount: profileData.badgeCount), // 프로바이더에서 가져온 뱃지 값 전달
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard(
      IconData icon, String stat, String description, double screenWidth) {
    final double height = screenWidth * 0.4; // 너비의 40%를 카드 높이로 설정

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 2,
      child: SizedBox(
        width: screenWidth * 0.26, // 고정된 너비
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
