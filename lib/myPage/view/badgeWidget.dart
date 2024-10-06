import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'allBadgePage.dart';

class BadgeWidget extends StatelessWidget {
  final int badgeCount; // badgeCount를 프로퍼티로 받을 것

  const BadgeWidget({super.key, required this.badgeCount});

  @override
  Widget build(BuildContext context) {
    // 화면에 최대 3개의 뱃지만 보여줄 수 있도록 설정
    List<Widget> badges = _buildBadgeList(badgeCount, 3);

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                '나의 활동 뱃지',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextButton(
                onPressed: () {
                  // "전체 보기" 버튼을 눌렀을 때 전체 뱃지 페이지로 이동
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AllBadgesPage(
                              badgeCounts: badgeCount,
                            ) // badgeCount 전달
                        ),
                  );
                },
                style: TextButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  backgroundColor: Colors.green[100],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: const Text(
                  '전체 보기',
                  style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            '친환경 생활에 따른 활동을 하면 주어져요',
            style: TextStyle(
              color: Colors.grey[600],
            ),
          ),
          const SizedBox(height: 16),
          // 최대 3개의 뱃지를 감싸는 컨테이너
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: badges,
            ),
          ),
        ],
      ),
    );
  }

  // badgeCount에 따라 나올 수 있는 뱃지 개수를 계산하는 함수
  List<Widget> _buildBadgeList(int badgeCount, int limit) {
    int totalBadges = (badgeCount / 30).floor(); // badgeCount에 따라 전체 뱃지 개수 계산
    totalBadges =
        totalBadges > limit ? limit : totalBadges; // 위젯에서 최대 limit개만 보여줌

    List<Widget> badges = [];
    for (int i = 1; i <= totalBadges; i++) {
      badges.add(
        Container(
          width: 80,
          height: 80,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(12),
          ),
          child: Image.asset(
            'assets/images/badge$i.png', // badge1.png, badge2.png 등
            width: 40,
            height: 40,
          ),
        ),
      );
    }
    return badges;
  }
}
