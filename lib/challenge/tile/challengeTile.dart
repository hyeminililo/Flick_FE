// import 'package:flick_frontend/common/const/colors.dart';
// import 'package:flutter/material.dart';

// class ChallengeTile extends StatelessWidget {
//   final String title;
//   final List<String> hashtags;
//   final int participants;
//   final String imageUrl;

//   const ChallengeTile({
//     super.key,
//     required this.title,
//     required this.hashtags,
//     required this.participants,
//     required this.imageUrl,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final screenWidth = MediaQuery.of(context).size.width;

//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           ClipRRect(
//             borderRadius: BorderRadius.circular(12.0), // 둥근 모서리 추가
//             child: Image.asset(
//               imageUrl,
//               width: screenWidth * 0.2, // 화면 너비의 20%
//               height: screenWidth * 0.2,
//               fit: BoxFit.cover,
//             ),
//           ),
//           SizedBox(
//             width: screenWidth * 0.05,
//           ),
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   title,
//                   style: const TextStyle(
//                       fontSize: 16.0,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.black),
//                   overflow: TextOverflow.ellipsis,
//                 ),
//                 const SizedBox(height: 4.0),
//                 Text(
//                   hashtags.join(' '),
//                   style: const TextStyle(color: PRIMARY_COLOR),
//                   overflow: TextOverflow.ellipsis,
//                 ),
//                 const SizedBox(height: 4.0),
//                 Row(
//                   children: [
//                     Image.asset(
//                       "assets/images/challengeMembers.png",
//                       width: screenWidth * 0.1, // 화면 너비의 10%로 설정
//                     ),
//                     const SizedBox(width: 4.0), // 간격 추가
//                     Expanded(
//                       child: Text(
//                         '$participants명 참가',
//                         style: const TextStyle(
//                             color: Colors.black, fontWeight: FontWeight.bold),
//                         overflow: TextOverflow.ellipsis,
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
