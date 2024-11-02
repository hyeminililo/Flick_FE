// // import 'package:flick_frontend/challenge/view/detailPage.dart';
// // import 'package:flick_frontend/challenge/view/provider/challenge_state.dart';
// // import 'package:flick_frontend/challenge/view/provider/mycahllenge_provider.dart';
// // import 'package:flutter/material.dart';
// // import 'package:flutter_riverpod/flutter_riverpod.dart';
// // import 'package:flick_frontend/challenge/tile/challengeTile.dart';

// // class MyChallenge extends ConsumerWidget {
// //   const MyChallenge({super.key});

// //   @override
// //   Widget build(BuildContext context, WidgetRef ref) {
// //     final challengesAsyncValue = ref.watch(myChallengesProvider);

// //     return challengesAsyncValue.when(
// //       data: (challenges) {
// //         return ListView.builder(
// //           itemCount: challenges.length,
// //           itemBuilder: (context, index) {
// //             final challenge = challenges[index];
// //             return Padding(
// //               padding: const EdgeInsets.symmetric(vertical: 8.0),
// //               child: GestureDetector(
// //                 onTap: () {
// //                   // DetailPage로 이동하며 challengeId 전달
// //                   Navigator.push(
// //                     context,
// //                     MaterialPageRoute(
// //                       builder: (context) => DetailPage(
// //                         challengeId: challenge.challengeId,
// //                       ),
// //                     ),
// //                   );
// //                 },
// //                 child: ChallengeTile(
// //                   title: challenge.title,
// //                   hashtags: challenge.hashtag,
// //                   participants: challenge.joinMembersCount,
// //                   imageUrl: challenge.imageUrl,
// //                 ),
// //               ),
// //             );
// //           },
// //         );
// //       },
// //       loading: () => const Center(child: CircularProgressIndicator()),
// //       error: (error, stack) => const Center(child: Text('오류가 발생했습니다.')),
// //     );
// //   }
// // }
// import 'package:flick_frontend/challenge/view/detailPage.dart';
// import 'package:flick_frontend/challenge/provider/mycahllenge_provider.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flick_frontend/challenge/tile/challengeTile.dart';

// class MyChallenge extends ConsumerWidget {
//   const MyChallenge({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final challengesAsyncValue =
//         ref.watch(myChallengesProvider); // 나의 챌린지 프로바이더 불러옴

//     return challengesAsyncValue.when(
//       data: (challenges) {
//         return ListView.builder(
//           itemCount: challenges.length,
//           itemBuilder: (context, index) {
//             final challenge = challenges[index];
//             return Padding(
//               padding: const EdgeInsets.symmetric(vertical: 8.0),
//               child: GestureDetector(
//                 onTap: () {
//                   // DetailPage로 이동하며 challengeId 전달
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => DetailPage(
//                         challengeId: challenge.challengeId,
//                       ),
//                     ),
//                   );
//                 },
//                 child: ChallengeTile(
//                   title: challenge.title,
//                   hashtags:
//                       challenge.hashtag ?? ['오류입니다'], // null일 경우 빈 리스트로 처리
//                   participants: challenge.joinMembersCount ?? 0,
//                   imageUrl: challenge.imageUrl ?? "",
//                 ),
//               ),
//             );
//           },
//         );
//       },
//       loading: () => const Center(child: CircularProgressIndicator()),
//       error: (error, stack) => const Center(child: Text('오류가 발생했습니다.')),
//     );
//   }
// }
