// // import 'package:flutter/material.dart';
// // import 'package:flick_frontend/common/const/colors.dart';

// // class RankScreen extends StatelessWidget {
// //   // UI 확인을 위해 임의의 데이터 입력함.
// //   // 이 부분에 멤버 끌어오는 로직 추가하면 됨
// //   final List<MemberInfo> members = [
// //     MemberInfo(
// //         id: 1,
// //         email: "user1@example.com",
// //         picture: "assets/images/flick.png",
// //         nickname: "홍길동",
// //         school: "학교1",
// //         gradeClass: "1학년",
// //         type: "STUDENT",
// //         score: 300),
// //     MemberInfo(
// //         id: 2,
// //         email: "user2@example.com",
// //         picture: "assets/images/flick.png",
// //         nickname: "이동홀",
// //         school: "학교2",
// //         gradeClass: "1학년",
// //         type: "STUDENT",
// //         score: 212),
// //     MemberInfo(
// //         id: 3,
// //         email: "user3@example.com",
// //         picture: "assets/images/flick.png",
// //         nickname: "김동이",
// //         school: "학교3",
// //         gradeClass: "1학년",
// //         type: "STUDENT",
// //         score: 172),
// //     MemberInfo(
// //         id: 4,
// //         email: "user4@example.com",
// //         picture: "assets/images/flick.png",
// //         nickname: "김순대",
// //         school: "학교4",
// //         gradeClass: "1학년",
// //         type: "STUDENT",
// //         score: 300),
// //     MemberInfo(
// //         id: 5,
// //         email: "user5@example.com",
// //         picture: "assets/images/flick.png",
// //         nickname: "김자반",
// //         school: "학교5",
// //         gradeClass: "1학년",
// //         type: "STUDENT",
// //         score: 124),
// //   ];

// //   RankScreen({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     final screenHeight = MediaQuery.of(context).size.height;
// //     final screenWidth = MediaQuery.of(context).size.width;

// //     return Scaffold(
// //       appBar: AppBar(
// //         title: const Text(
// //           '친환경 랭킹',
// //           style: TextStyle(color: PRIMARY_COLOR, fontWeight: FontWeight.bold),
// //         ),
// //       ),
// //       body: SingleChildScrollView(
// //         child: Column(
// //           children: [
// //             // Top 3 section
// //             Padding(
// //               padding: const EdgeInsets.all(8.0),
// //               child: Row(
// //                 mainAxisAlignment: MainAxisAlignment.center,
// //                 crossAxisAlignment: CrossAxisAlignment.end,
// //                 children: [
// //                   // 2nd
// //                   _buildTopMember(
// //                       members[1], screenWidth * 0.2, 2), // 화면 너비의 20%로 설정
// //                   // 1st
// //                   _buildTopMember(
// //                       members[0], screenWidth * 0.25, 1), // 화면 너비의 25%로 설정
// //                   // 3rd
// //                   _buildTopMember(
// //                       members[2], screenWidth * 0.2, 3), // 화면 너비의 20%로 설정
// //                 ],
// //               ),
// //             ),
// //             // 리스트로 전체 순위 표시.
// //             Container(
// //               padding: const EdgeInsets.all(10.0),
// //               child: ListView.builder(
// //                 shrinkWrap: true,
// //                 physics: const NeverScrollableScrollPhysics(),
// //                 itemCount: members.length,
// //                 itemBuilder: (context, index) {
// //                   final member = members[index];
// //                   return Padding(
// //                     padding: const EdgeInsets.only(bottom: 8.0),
// //                     child: Container(
// //                       decoration: BoxDecoration(
// //                         color: index == 0 ? PRIMARY_COLOR : Colors.white,
// //                         borderRadius: BorderRadius.circular(10),
// //                         boxShadow: const [
// //                           BoxShadow(
// //                             color: Colors.black12,
// //                             blurRadius: 5,
// //                           ),
// //                         ],
// //                       ),
// //                       child: ListTile(
// //                         // 순위 표시
// //                         title: Row(
// //                           children: [
// //                             // 순위 텍스트
// //                             Text(
// //                               '${index + 1}', // 인덱스에 1을 더해 순위를 표시
// //                               style: TextStyle(
// //                                 color: index == 0 ? Colors.white : Colors.black,
// //                                 fontWeight: FontWeight.bold,
// //                                 fontSize: 20,
// //                               ),
// //                             ),
// //                             SizedBox(
// //                                 width: screenWidth * 0.05), // 순위와 이미지 간의 간격
// //                             CircleAvatar(
// //                               backgroundImage: AssetImage(member.picture),
// //                             ),
// //                             SizedBox(
// //                                 width: screenWidth * 0.05), // 이미지와 텍스트 간의 간격
// //                             Expanded(
// //                               child: Row(
// //                                 mainAxisAlignment:
// //                                     MainAxisAlignment.start, // 왼쪽 정렬
// //                                 children: [
// //                                   // 닉네임 텍스트
// //                                   Expanded(
// //                                     child: Text(
// //                                       member.nickname,
// //                                       style: TextStyle(
// //                                         color: index == 0
// //                                             ? Colors.white
// //                                             : Colors.black,
// //                                         fontWeight: FontWeight.bold,
// //                                       ),
// //                                     ),
// //                                   ),
// //                                   // 점수 텍스트
// //                                   Text(
// //                                     '${member.score}점',
// //                                     style: TextStyle(
// //                                       color: index == 0
// //                                           ? Colors.white
// //                                           : Colors.black,
// //                                     ),
// //                                   ),
// //                                 ],
// //                               ),
// //                             ),
// //                           ],
// //                         ),
// //                       ),
// //                     ),
// //                   );
// //                 },
// //               ),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }

// //   // Top 3 멤버를 위한 위젯 (사이즈 조정)
// //   Widget _buildTopMember(MemberInfo member, double size, int place) {
// //     return Padding(
// //       padding: const EdgeInsets.all(8.0),
// //       child: Column(
// //         children: [
// //           Stack(
// //             alignment: Alignment.topRight,
// //             children: [
// //               const SizedBox(
// //                 height: 4.0,
// //               ),
// //               Container(
// //                 width: size * 1.2,
// //                 height: size * 1.7,
// //                 decoration: BoxDecoration(
// //                   color: Colors.white,
// //                   borderRadius: BorderRadius.circular(15),
// //                   boxShadow: const [
// //                     BoxShadow(color: Colors.black12, blurRadius: 5)
// //                   ],
// //                 ),
// //                 child: Center(
// //                   child: Column(
// //                     mainAxisAlignment: MainAxisAlignment.center,
// //                     children: [
// //                       CircleAvatar(
// //                         backgroundImage: AssetImage(member.picture),
// //                         radius: size / 3,
// //                       ),
// //                       const SizedBox(height: 5),
// //                       Text(
// //                         '${member.score}p',
// //                         style: const TextStyle(
// //                             fontSize: 16, fontWeight: FontWeight.bold),
// //                       ),
// //                       const SizedBox(height: 5),
// //                       Text(member.nickname),
// //                     ],
// //                   ),
// //                 ),
// //               ),
// //               // 순위에 따라 아이콘 표시
// //               if (place == 1) const Icon(Icons.star, color: Colors.yellow),
// //               if (place == 2) const Icon(Icons.star, color: Colors.grey),
// //               if (place == 3) const Icon(Icons.star, color: Colors.brown),
// //             ],
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }

// // class MemberInfo {
// //   final int id;
// //   final String email;
// //   final String picture;
// //   final String nickname;
// //   final String school;
// //   final String gradeClass;
// //   final String type;
// //   final int score;

// //   MemberInfo({
// //     required this.id,
// //     required this.email,
// //     required this.picture,
// //     required this.nickname,
// //     required this.school,
// //     required this.gradeClass,
// //     required this.type,
// //     required this.score,
// //   });
// // }

// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flick_frontend/common/const/colors.dart';

// // // MemberInfo 모델
// // class MemberInfo {
// //   final int id;
// //   final String email;
// //   final String picture;
// //   final String nickname;
// //   final String school;
// //   final String gradeClass;
// //   final String type;
// //   final int score;

// //   MemberInfo({
// //     required this.id,
// //     required this.email,
// //     required this.picture,
// //     required this.nickname,
// //     required this.school,
// //     required this.gradeClass,
// //     required this.type,
// //     required this.score,
// //   });
// // }

// // 프로바이더 생성
// final membersProvider = Provider<List<MemberInfo>>((ref) {
//   return [
//     MemberInfo(
//         id: 1,
//         email: "user1@example.com",
//         picture: "assets/images/flick.png",
//         nickname: "홍길동",
//         school: "학교1",
//         gradeClass: "1학년",
//         type: "STUDENT",
//         score: 300),
//     MemberInfo(
//         id: 2,
//         email: "user2@example.com",
//         picture: "assets/images/flick.png",
//         nickname: "이동홀",
//         school: "학교2",
//         gradeClass: "1학년",
//         type: "STUDENT",
//         score: 212),
//     MemberInfo(
//         id: 3,
//         email: "user3@example.com",
//         picture: "assets/images/flick.png",
//         nickname: "김동이",
//         school: "학교3",
//         gradeClass: "1학년",
//         type: "STUDENT",
//         score: 172),
//     MemberInfo(
//         id: 4,
//         email: "user4@example.com",
//         picture: "assets/images/flick.png",
//         nickname: "김순대",
//         school: "학교4",
//         gradeClass: "1학년",
//         type: "STUDENT",
//         score: 300),
//     MemberInfo(
//         id: 5,
//         email: "user5@example.com",
//         picture: "assets/images/flick.png",
//         nickname: "김자반",
//         school: "학교5",
//         gradeClass: "1학년",
//         type: "STUDENT",
//         score: 124),
//   ];
// });

// class RankScreen extends ConsumerWidget {
//   const RankScreen({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final members = ref.watch(membersProvider);
//     final screenWidth = MediaQuery.of(context).size.width;

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           '친환경 랭킹',
//           style: TextStyle(color: PRIMARY_COLOR, fontWeight: FontWeight.bold),
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             // Top 3 section
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.end,
//                 children: [
//                   // 2nd
//                   _buildTopMember(members[1], screenWidth * 0.2, 2),
//                   // 1st
//                   _buildTopMember(members[0], screenWidth * 0.25, 1),
//                   // 3rd
//                   _buildTopMember(members[2], screenWidth * 0.2, 3),
//                 ],
//               ),
//             ),
//             // 리스트로 전체 순위 표시
//             Container(
//               padding: const EdgeInsets.all(10.0),
//               child: ListView.builder(
//                 shrinkWrap: true,
//                 physics: const NeverScrollableScrollPhysics(),
//                 itemCount: members.length,
//                 itemBuilder: (context, index) {
//                   final member = members[index];
//                   return Padding(
//                     padding: const EdgeInsets.only(bottom: 8.0),
//                     child: Container(
//                       decoration: BoxDecoration(
//                         color: index == 0 ? PRIMARY_COLOR : Colors.white,
//                         borderRadius: BorderRadius.circular(10),
//                         boxShadow: const [
//                           BoxShadow(
//                             color: Colors.black12,
//                             blurRadius: 5,
//                           ),
//                         ],
//                       ),
//                       child: ListTile(
//                         // 순위 표시
//                         title: Row(
//                           children: [
//                             // 순위 텍스트
//                             Text(
//                               '${index + 1}',
//                               style: TextStyle(
//                                 color: index == 0 ? Colors.white : Colors.black,
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: 20,
//                               ),
//                             ),
//                             SizedBox(width: screenWidth * 0.05),
//                             CircleAvatar(
//                               backgroundImage: AssetImage(member.picture),
//                             ),
//                             SizedBox(width: screenWidth * 0.05),
//                             Expanded(
//                               child: Row(
//                                 mainAxisAlignment: MainAxisAlignment.start,
//                                 children: [
//                                   // 닉네임 텍스트
//                                   Expanded(
//                                     child: Text(
//                                       member.nickname,
//                                       style: TextStyle(
//                                         color: index == 0
//                                             ? Colors.white
//                                             : Colors.black,
//                                         fontWeight: FontWeight.bold,
//                                       ),
//                                     ),
//                                   ),
//                                   // 점수 텍스트
//                                   Text(
//                                     '${member.score}점',
//                                     style: TextStyle(
//                                       color: index == 0
//                                           ? Colors.white
//                                           : Colors.black,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   // Top 3 멤버를 위한 위젯 (사이즈 조정)
//   Widget _buildTopMember(MemberInfo member, double size, int place) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Column(
//         children: [
//           Stack(
//             alignment: Alignment.topRight,
//             children: [
//               const SizedBox(height: 4.0),
//               Container(
//                 width: size * 1.2,
//                 height: size * 1.7,
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(15),
//                   boxShadow: const [
//                     BoxShadow(color: Colors.black12, blurRadius: 5)
//                   ],
//                 ),
//                 child: Center(
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       CircleAvatar(
//                         backgroundImage: AssetImage(member.picture),
//                         radius: size / 3,
//                       ),
//                       const SizedBox(height: 5),
//                       Text(
//                         '${member.score}p',
//                         style: const TextStyle(
//                             fontSize: 16, fontWeight: FontWeight.bold),
//                       ),
//                       const SizedBox(height: 5),
//                       Text(member.nickname),
//                     ],
//                   ),
//                 ),
//               ),
//               // 순위에 따라 아이콘 표시
//               if (place == 1) const Icon(Icons.star, color: Colors.yellow),
//               if (place == 2) const Icon(Icons.star, color: Colors.grey),
//               if (place == 3) const Icon(Icons.star, color: Colors.brown),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
