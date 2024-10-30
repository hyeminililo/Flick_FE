// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flick_frontend/common/const/colors.dart';

// // // // MemberInfo 모델
// // // class MemberInfo2 {
// // //   final int id;
// // //   final String email;
// // //   final String picture;
// // //   final String nickname;
// // //   final String school;
// // //   final String gradeClass;
// // //   final String type;
// // //   final int score;

// // //   MemberInfo2({
// // //     required this.id,
// // //     required this.email,
// // //     required this.picture,
// // //     required this.nickname,
// // //     required this.school,
// // //     required this.gradeClass,
// // //     required this.type,
// // //     required this.score,
// // //   });
// // // }

// // // 프로바이더 생성
// // final membersProvider2 = Provider<List<MemberInfo>>((ref) {
// //   return [
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
// // });

// class StudentRankScreen extends ConsumerWidget {
//   const StudentRankScreen({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final members = ref.watch(membersProvider2);
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
//   Widget _buildTopMember(MemberInfo2 member, double size, int place) {
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
import 'package:flick_frontend/ranking/provider/generalRanking_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flick_frontend/common/const/colors.dart';

import 'package:flick_frontend/ranking/model/studentRanking_model.dart';

// RankingService를 통해 학생 랭킹 데이터를 불러오는 Provider 생성
final studentRankingProvider =
    FutureProvider<List<StudentRanking>>((ref) async {
  final rankingService = ref.watch(rankingServiceProvider);
  return await rankingService.fetchStudentRankingList();
});

class StudentRankScreen extends ConsumerWidget {
  const StudentRankScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screenWidth = MediaQuery.of(context).size.width;
    final studentListAsync = ref.watch(studentRankingProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '친환경 랭킹',
          style: TextStyle(color: PRIMARY_COLOR, fontWeight: FontWeight.bold),
        ),
      ),
      // 학생 랭킹 데이터를 불러올 때의 UI 상태를 처리합니다
      body: studentListAsync.when(
        data: (students) => SingleChildScrollView(
          child: Column(
            children: [
              // Top 3 섹션
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    // 학생이 2명 이상일 때 2등 표시
                    if (students.length > 1)
                      _buildTopStudent(students[1], screenWidth * 0.2, 2),
                    // 학생 데이터가 있을 때 1등 표시
                    if (students.isNotEmpty)
                      _buildTopStudent(students[0], screenWidth * 0.25, 1),
                    // 학생이 3명 이상일 때 3등 표시
                    if (students.length > 2)
                      _buildTopStudent(students[2], screenWidth * 0.2, 3),
                  ],
                ),
              ),
              // 전체 순위 리스트
              Container(
                padding: const EdgeInsets.all(10.0),
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: students.length,
                  itemBuilder: (context, index) {
                    final student = students[index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 5.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: index == 0 ? PRIMARY_COLOR : Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 5,
                            ),
                          ],
                        ),
                        child: ListTile(
                          title: Row(
                            children: [
                              // 순위 텍스트
                              Text(
                                '${index + 1}',
                                style: TextStyle(
                                  color:
                                      index == 0 ? Colors.white : Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                              SizedBox(width: screenWidth * 0.05),
                              CircleAvatar(
                                child: ClipOval(
                                  child: Image.asset(
                                    'assets/images/profile.png', // 파일 확장자도 포함해야 합니다.
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),

                              SizedBox(width: screenWidth * 0.05),
                              // 학년 및 반 텍스트
                              Expanded(
                                child: Text(
                                  '${student.grade}-${student.classNum}반',
                                  style: TextStyle(
                                    color: index == 0
                                        ? Colors.white
                                        : Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              // 점수 텍스트
                              Text(
                                '${student.totalScore}p',
                                style: TextStyle(
                                  color:
                                      index == 0 ? Colors.white : Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) => Center(
          child: Text('Failed to load ranking: $error'),
        ),
      ),
    );
  }

  // Top 3 학생을 위한 UI 위젯 (사이즈 조정)
  Widget _buildTopStudent(StudentRanking student, double size, int place) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Stack(
            alignment: Alignment.topRight,
            children: [
              const SizedBox(height: 4.0),
              Container(
                width: size * 1.2,
                height: size * 1.5,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: const [
                    BoxShadow(color: Colors.black12, blurRadius: 5),
                  ],
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 5),
                      CircleAvatar(
                        child: ClipOval(
                          child: Image.asset(
                            'assets/images/profile.png', // 파일 확장자도 포함해야 합니다.
                            fit: BoxFit.cover,
                            width: 100,
                            height: 100,
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      Text(
                        ' ${student.grade}-${student.classNum}반',
                        style: const TextStyle(
                          fontSize: 16,
                          color: PRIMARY_COLOR,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        '${student.totalScore}p',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // 순위에 따라 아이콘 표시
              if (place == 1) const Icon(Icons.star, color: Colors.yellow),
              if (place == 2) const Icon(Icons.star, color: Colors.grey),
              if (place == 3) const Icon(Icons.star, color: Colors.brown),
            ],
          ),
        ],
      ),
    );
  }
}
