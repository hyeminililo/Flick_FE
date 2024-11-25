import 'package:flick_frontend/common/const/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AllBadgesPage extends ConsumerWidget {
  final int badgeCounts; // badgeCount를 받을 프로퍼티

  const AllBadgesPage({super.key, required this.badgeCounts}); // 생성자 수정

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screenWidth = MediaQuery.of(context).size.width;

    // 전체 뱃지를 보여줌
    List<Widget> allBadges = (badgeCounts / 30).floor() > 0
        ? List.generate(
            (badgeCounts.clamp(0, 300) / 30).floor(),
            (index) => GestureDetector(
              onTap: () {
                _showBadgeDetails(context, index + 1); // 뱃지 클릭 시 상세 설명 표시
              },
              child: Container(
                width: screenWidth * 0.2, // 전체 너비의 20%로 설정
                height: screenWidth * 0.2, // 전체 너비의 20%로 설정
                padding: const EdgeInsets.all(16),
                margin: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Image.asset(
                  'assets/images/badge${index + 1}.png',
                  width: 40,
                  height: 40,
                ),
              ),
            ),
          )
        : [];
// 이 부분에 대해서 의문 : 나의 활동 뱃지를 보여주는 건지 전체를 보여주는 건지
    return Scaffold(
      appBar: AppBar(
        title: const Text("나의 활동 뱃지"),
      ),
      body: Padding(
        padding: EdgeInsets.all(screenWidth * 0.04), // 화면 너비의 4% 패딩
        child: GridView.count(
          crossAxisCount: 3, // 한 줄에 3개의 뱃지씩 배치
          children: allBadges,
        ),
      ),
    );
  }

  // 뱃지 상세 설명 모달 표시
  void _showBadgeDetails(BuildContext context, int badgeIndex) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(screenWidth * 0.05), // 화면 너비의 5% 패딩
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: screenHeight * 0.02),
              Image.asset(
                "assets/images/badge$badgeIndex.png",
                width: screenWidth * 0.2, // 화면 너비의 15%로 설정
                height: screenWidth * 0.2, // 화면 너비의 15%로 설정
              ),
              Text(
                '${badgeIndex * 30} p 뱃지',
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              Text(
                '챌린지를 ${badgeIndex * 30}회 실천하면 뱃지를 받을 수 있어요!',
                style: const TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context); // 확인 버튼 클릭 시 모달 닫기
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: PRIMARY_COLOR,
                  padding: EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.4, // 화면 너비의 20% 패딩
                    vertical: screenHeight * 0.02, // 화면 높이의 2% 패딩
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  "확인",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
