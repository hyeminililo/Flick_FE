import 'package:flick_frontend/auth/provider/auth_provider.dart';
import 'package:flick_frontend/auth/view/login_screen.dart';
import 'package:flick_frontend/common/const/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart'; // 추가된 import
import 'editProfileScreen.dart'; // EditProfileScreen 페이지 import

class EditMyProfile extends ConsumerWidget {
  final String profileImage;
  const EditMyProfile({super.key, required this.profileImage});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '설정',
          style: TextStyle(fontSize: 20),
        ),
        centerTitle: true, // AppBar title을 중앙에 배치
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(screenWidth * 0.05), // 화면 너비의 5% 패딩
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '계정 설정',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                // 내 프로필 수정 버튼 클릭 시 EditProfileScreen으로 이동
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EditProfileScreen(
                      profileImage: profileImage,
                    ),
                  ),
                );
              },
              child: Container(
                padding: EdgeInsets.all(screenWidth * 0.05), // 패딩
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(width: 5), // 왼쪽 여백
                    Container(
                      width: screenWidth * 0.1, // 화면 너비의 10%로 설정
                      height: screenWidth * 0.1, // 화면 너비의 10%로 설정
                      decoration: BoxDecoration(
                        color: Colors.grey, // 배경색 설정
                        borderRadius: BorderRadius.circular(8), // 모서리 둥글기 설정
                      ),
                      child: ClipOval(
                        // 이미지를 원형으로 자르기
                        child: Image.asset(
                          "assets/images/editMyPage.png",
                          fit: BoxFit.cover, // 이미지 비율 유지
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    const Text(
                      '내 프로필 수정',
                      style: TextStyle(fontSize: 18),
                    ),
                    const Spacer(), // 오른쪽으로 밀기
                    const Icon(Icons.arrow_forward_ios, size: 20), // 화살표 아이콘
                  ],
                ),
              ),
            ),
            const Spacer(), // 아래쪽 여백 확보
            Container(
              width: double.infinity, // 버튼이 가득 차게
              padding: EdgeInsets.all(screenWidth * 0.05),
              child: ElevatedButton(
                onPressed: () {
                  // 로그아웃 버튼 클릭 시 행동
                  ref.read(authProvider.notifier).logout();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginScreen(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey[400], // 배경색
                  padding: EdgeInsets.symmetric(
                    vertical: screenHeight * 0.02,
                    horizontal: screenWidth * 0.1, // 수평 패딩
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10), // 둥근 정도 줄이기 (5픽셀)
                  ),
                ),
                child: const Text(
                  '플릭 로그아웃',
                  style: TextStyle(color: MAIN_BG_COLOR), // 텍스트 색상
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
