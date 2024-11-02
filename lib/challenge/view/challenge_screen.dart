// import 'package:flick_frontend/challenge/view/myChallenge.dart';
// import 'package:flick_frontend/challenge/provider/challengeDio_provider.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'myChallenge2.dart';
// import 'openChallenge.dart';
// import '../../common/const/colors.dart';

// class ChallengeScreen extends ConsumerWidget {
//   const ChallengeScreen({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final state = ref.watch(challengeProvider); // 챌린지 프로바이더 받아옴
//     final notifier = ref.read(challengeProvider.notifier); // 챌린지 프로바이더 상태를받아옴
//     BorderSide side = const BorderSide(color: Colors.grey, width: 2.0);
//     final screenHeight = MediaQuery.of(context).size.height;

//     // 챌린지 리스트 로드
//     notifier.loadChallengeList(); // 챌린지 리스트 로드

//     return DefaultTabController(
//       length: 2, // TabBar의 탭 수
//       child: Scaffold(
//         appBar: AppBar(
//           title: const Text(
//             "챌린지",
//             style: TextStyle(
//               color: PRIMARY_COLOR,
//               fontFamily: "Pretendard",
//               fontSize: 25.0,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           bottom: TabBar(
//             onTap: (index) {
//               notifier.changeTab(index);
//             },
//             tabs: [
//               Container(
//                 height: screenHeight * 0.05,
//                 alignment: Alignment.center,
//                 child: const Text("나의 챌린지"),
//               ),
//               Container(
//                 height: screenHeight * 0.05,
//                 alignment: Alignment.center,
//                 child: const Text("오픈 챌린지"),
//               ),
//             ],
//             indicatorColor: Colors.transparent,
//             labelColor: PRIMARY_COLOR,
//             unselectedLabelColor: Colors.grey,
//           ),
//         ),
//         body: state.isLoading
//             ? const Center(child: CircularProgressIndicator())
//             : const TabBarView(
//                 children: [
//                   MyChallenge(), // 나의 챌린지 탭
//                   OpenChallenge(), // 오픈 챌린지 탭
//                 ],
//               ),
//       ),
//     );
//   }
// }
