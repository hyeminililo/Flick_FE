// import 'package:flutter/material.dart';

// // BadgeWidget: 메인 화면에서 뱃지들을 보여주는 위젯
// class BadgeWidget extends StatefulWidget {
//   final int badgeCount;

//   const BadgeWidget({super.key, required this.badgeCount});

//   @override
//   _BadgeWidgetState createState() => _BadgeWidgetState();
// }

// class _BadgeWidgetState extends State<BadgeWidget> {
//   @override
//   Widget build(BuildContext context) {
//     // 뱃지의 개수를 표시하기 위한 리스트
//     List<Widget> badges = [];

//     // badgeCount에 따라 몇 개의 뱃지를 표시할지 결정
//     int numberOfBadges = _calculateBadgeCount(widget.badgeCount);

//     // 뱃지 개수에 따라 뱃지 컨테이너 위젯 추가
//     for (int i = 1; i <= numberOfBadges; i++) {
//       badges.add(
//         Container(
//           width: 80,
//           height: 80,
//           padding: const EdgeInsets.all(16),
//           decoration: BoxDecoration(
//             color: Colors.grey[200],
//             borderRadius: BorderRadius.circular(12),
//           ),
//           child: Image.asset(
//             'assets/images/badge$i.png', // badge1.png, badge2.png 등
//             width: 40,
//             height: 40,
//           ),
//         ),
//       );
//     }

//     // 가장 큰 컨테이너가 3개의 뱃지 컨테이너를 감싸는 구조
//     return Container(
//       padding: const EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(8),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               const Text(
//                 '나의 활동 뱃지',
//                 style: TextStyle(
//                   fontSize: 18,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               TextButton(
//                 onPressed: () {
//                   //  "벳지 전체 보기"
//                 },
//                 style: TextButton.styleFrom(
//                   padding:
//                       const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
//                   backgroundColor: Colors.green[100],
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(16),
//                   ),
//                 ),
//                 child: const Text(
//                   '전체 보기',
//                   style: TextStyle(
//                     color: Colors.green,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           const SizedBox(height: 8),
//           Text(
//             '친환경 생활에 따른 활동을 하면 주어져요',
//             style: TextStyle(
//               color: Colors.grey[600],
//             ),
//           ),
//           const SizedBox(height: 16),
//           // 3개의 뱃지 컨테이너를 감싸는 큰 컨테이너
//           Container(
//             padding: const EdgeInsets.all(16),
//             decoration: BoxDecoration(
//               color: Colors.grey[100],
//               borderRadius: BorderRadius.circular(16),
//             ),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: badges,
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   // badgeCount에 따라 보여줄 뱃지 수 계산
//   int _calculateBadgeCount(int badgeCount) {
//     if (badgeCount >= 30 && badgeCount < 60) {
//       return 1;
//     } else if (badgeCount >= 60 && badgeCount < 90) {
//       return 2;
//     } else if (badgeCount >= 90) {
//       return 3;
//     } else {
//       return 0; // 뱃지가 없는 경우
//     }
//   }
// }

import 'package:flick_frontend/common/view/myPage/view/allBadgePage.dart';
import 'package:flutter/material.dart';

// BadgeWidget: 메인 화면에서 뱃지들을 보여주는 위젯
class BadgeWidget extends StatefulWidget {
  final int badgeCount;

  const BadgeWidget({super.key, required this.badgeCount});

  @override
  _BadgeWidgetState createState() => _BadgeWidgetState();
}

class _BadgeWidgetState extends State<BadgeWidget> {
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

  @override
  Widget build(BuildContext context) {
    // 화면에 최대 3개의 뱃지만 보여줄 수 있도록 설정
    List<Widget> badges = _buildBadgeList(widget.badgeCount, 3);

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
                      builder: (context) =>
                          AllBadgesPage(badgeCount: widget.badgeCount),
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
}
