// import 'package:camera/camera.dart';
// import 'package:flick_frontend/challenge/view/myChallenge.dart';
// import 'package:flick_frontend/challenge/view/openChallenge.dart';
// import 'package:flick_frontend/common/const/colors.dart';
// import 'package:flutter/material.dart';

// class ChallengeScreen extends StatefulWidget {
//   const ChallengeScreen({super.key});

//   @override
//   State<ChallengeScreen> createState() => _ChallengeScreenState();
// }

// class _ChallengeScreenState extends State<ChallengeScreen>
//     with TickerProviderStateMixin {
//   late TabController _tabController;

//   @override
//   void initState() {
//     _tabController = TabController(length: 2, vsync: this);
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     BorderSide side = const BorderSide(
//       color: Colors.grey, // 보더 색상
//       width: 2.0, // 보더 두께
//     );

//     final screenHeight = MediaQuery.of(context).size.height; // 화면 높이
//     final screenWidth = MediaQuery.of(context).size.width; // 화면 너비

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           "챌린지",
//           style: TextStyle(
//             color: PRIMARY_COLOR,
//             fontFamily: "Pretendard",
//             fontSize: 25.0,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//       ),
//       body: Column(
//         children: [
//           Container(
//             decoration: BoxDecoration(
//               border: Border(
//                 top: BorderSide.none, // 위쪽 보더를 없앱니다.
//                 left: side, // 왼쪽 보더
//                 right: side, // 오른쪽 보더
//                 bottom: side,
//               ),
//             ),
//             child: TabBar(
//               tabs: [
//                 Container(
//                   height: screenHeight * 0.05, // 화면 높이의 5%로 설정
//                   alignment: Alignment.center,
//                   child: const Text("나의 챌린지"),
//                 ),
//                 Container(
//                   height: screenHeight * 0.05, // 화면 높이의 5%로 설정
//                   alignment: Alignment.center,
//                   child: const Text("오픈 챌린지"),
//                 ),
//               ],
//               indicatorColor: Colors.transparent,
//               labelColor: PRIMARY_COLOR,
//               unselectedLabelColor: Colors.grey,
//               controller: _tabController,
//             ),
//           ),
//           Expanded(
//             child: TabBarView(
//               controller: _tabController,
//               children: const [MyChallenge(), OpenChallenge()],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flick_frontend/challenge/view/provider/challenge_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'myChallenge.dart';
import 'openChallenge.dart';
import '../../common/const/colors.dart';

class ChallengeScreen extends ConsumerWidget {
  const ChallengeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(challengeProvider);
    BorderSide side = const BorderSide(color: Colors.grey, width: 2.0);
    final screenHeight = MediaQuery.of(context).size.height;

    return DefaultTabController(
      length: 2, // TabBar의 탭 수
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "챌린지",
            style: TextStyle(
              color: PRIMARY_COLOR,
              fontFamily: "Pretendard",
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          bottom: TabBar(
            onTap: (index) {
              ref.read(challengeProvider.notifier).changeTab(index);
            },
            tabs: [
              Container(
                height: screenHeight * 0.05,
                alignment: Alignment.center,
                child: const Text("나의 챌린지"),
              ),
              Container(
                height: screenHeight * 0.05,
                alignment: Alignment.center,
                child: const Text("오픈 챌린지"),
              ),
            ],
            indicatorColor: Colors.transparent,
            labelColor: PRIMARY_COLOR,
            unselectedLabelColor: Colors.grey,
          ),
        ),
        body: const TabBarView(
          children: [MyChallenge(), OpenChallenge()],
        ),
      ),
    );
  }
}
