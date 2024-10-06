// import 'package:flick_frontend/myPage/view/badgeWidget.dart';
// import 'package:flutter/material.dart';

// class ProfileScreen extends StatefulWidget {
//   final String imageUrl;
//   final String name;
//   final String stat1;
//   final String stat2;
//   final String stat3;
//   final int badgeCount;

//   const ProfileScreen({
//     super.key,
//     required this.imageUrl,
//     required this.name,
//     required this.stat1,
//     required this.stat2,
//     required this.stat3,
//     required this.badgeCount,
//   });

//   @override
//   _ProfileScreenState createState() => _ProfileScreenState();
// }

// class _ProfileScreenState extends State<ProfileScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('프로필'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             // 프로필 이미지와 이름
//             CircleAvatar(
//               radius: 50,
//               backgroundImage: NetworkImage(widget.imageUrl),
//             ),
//             const SizedBox(height: 10),
//             Text(
//               widget.name,
//               style: const TextStyle(
//                 fontSize: 24,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             const SizedBox(height: 20),

//             // 세 개의 통계 컨테이너
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: [
//                 _buildStatContainer(Icons.calendar_today, widget.stat1, '진행중'),
//                 _buildStatContainer(
//                     Icons.event_available, widget.stat2, '최근 실천 챌린지'),
//                 _buildStatContainer(
//                     Icons.access_time, widget.stat3, '누적 실천 횟수'),
//               ],
//             ),
//             const SizedBox(height: 20),

//             // 배지 섹션
//             Container(
//               padding: const EdgeInsets.all(16),
//               decoration: BoxDecoration(
//                 color: Colors.grey[200],
//                 borderRadius: BorderRadius.circular(8),
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const Text(
//                     '나의 활동 배지',
//                     style: TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   const SizedBox(height: 10),

//                   // BadgeWidget을 호출하여 뱃지를 동적으로 표시
//                   BadgeWidget(badgeCount: widget.badgeCount),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   // 통계 컨테이너 위젯 생성
//   Widget _buildStatContainer(IconData icon, String stat, String description) {
//     return Container(
//       width: 100,
//       padding: const EdgeInsets.all(8),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(12),
//         border: Border.all(color: Colors.grey[300]!),
//       ),
//       child: Column(
//         children: [
//           Icon(icon, size: 30, color: Colors.grey[700]),
//           const SizedBox(height: 10),
//           Text(
//             stat,
//             style: const TextStyle(
//               fontSize: 16,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           const SizedBox(height: 5),
//           Text(
//             description,
//             style: TextStyle(
//               fontSize: 12,
//               color: Colors.grey[600],
//             ),
//             textAlign: TextAlign.center,
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flick_frontend/common/view/myPage/view/badgeWidget.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // 임의의 데이터를 설정 (서버로부터 데이터를 받는다고 가정)
  String name = '홍길동'; // 임의의 이름
  String stat1 = '17일째'; // 통계 값 1
  String stat2 = '텀블러 사용'; // 통계 값 2
  String stat3 = '123번'; // 통계 값 3
  int badgeCount = 300; // 임의의 뱃지 횟수 (서버에서 받는 값)

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xffE2E2E2),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(
              height: screenHeight * 0.05,
            ),
            // 프로필 이미지와 이름
            // 이미지 클릭했을 때 수정하는 페이지로 이동하게 만들어야 함.
            // 즉, 수정이 필요함.
            const CircleAvatar(
              radius: 80,
              backgroundImage:
                  AssetImage('assets/images/google.png'), // 테스트용 asset 이미지 경로
            ),
            SizedBox(height: screenHeight * 0.02),
            Text(
              name, // 임의의 이름
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
                _buildStatCard(Icons.calendar_today, stat1, '진행중', screenWidth),
                _buildStatCard(
                    Icons.event_available, stat2, '최근 실천 챌린지', screenWidth),
                _buildStatCard(
                    Icons.access_time, stat3, '누적 실천 횟수', screenWidth),
              ],
            ),
            const SizedBox(height: 20),

            // 뱃지 섹션 테스트
            // 뱃지 위젯 수정해야함. 밥 먹고 와서
            BadgeWidget(badgeCount: badgeCount), // 임의의 뱃지 값 전달
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard(
      IconData icon, String stat, String description, double screenWidth) {
    final double height = screenWidth * 0.4; // 너비의 25%를 카드 높이로 설정

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
