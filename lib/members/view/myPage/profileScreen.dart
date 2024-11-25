// import 'package:flick_frontend/common/const/colors.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flick_frontend/members/provider/member_state.dart';
// import 'package:flick_frontend/members/provider/members_provider.dart';
// import 'package:flick_frontend/members/view/myPage/editMyProfile.dart';
// import 'badgeWidget.dart';

// class MyPageScreen2 extends ConsumerWidget {
//   const MyPageScreen2({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final profileState = ref.watch(membersProfileNotifierProvider);

//     ref.listen<MemberProfileState>(membersProfileNotifierProvider,
//         (previous, next) {
//       next.maybeWhen(
//         error: (message) {
//           ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(content: Text(message)),
//           );
//         },
//         orElse: () {},
//       );
//     });

//     final screenHeight = MediaQuery.of(context).size.height;
//     final screenWidth = MediaQuery.of(context).size.width;

//     return Scaffold(
//       body: SafeArea(
//         child: profileState.when(
//           initial: () {
//             Future.microtask(() => ref
//                 .read(membersProfileNotifierProvider.notifier)
//                 .fetchMemberInfo());
//             return const Center(child: CircularProgressIndicator());
//           },
//           loading: () => const Center(child: CircularProgressIndicator()),
//           loaded: (memberInfo) {
//             return SingleChildScrollView(
//               child: Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     SizedBox(height: screenHeight * 0.05),
//                     GestureDetector(
//                       onTap: () async {
//                         final result = await Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => EditMyProfile(
//                               profileImage: memberInfo.picture ??
//                                   "assets/images/flick.png", // 프로필 이미지 전달
//                             ),
//                           ),
//                         );

//                         if (result == true) {
//                           ref
//                               .read(membersProfileNotifierProvider.notifier)
//                               .fetchMemberInfo(); // 최신 정보 로드
//                         }
//                       },
//                       child: Container(
//                         width: 160, // CircleAvatar 크기와 맞추기
//                         height: 160, // CircleAvatar 크기와 맞추기
//                         decoration: BoxDecoration(
//                           shape: BoxShape.circle, // 원형 테두리
//                           border: Border.all(
//                             color: PRIMARY_COLOR, // 테두리 색상
//                             width: 4.0, // 테두리 두께
//                           ),
//                         ),
//                         child: CircleAvatar(
//                           radius: 80, // 원형 이미지 크기
//                           backgroundImage: memberInfo.picture != null
//                               ? NetworkImage(memberInfo.picture!) // 네트워크 이미지
//                               : const AssetImage(
//                                       "assets/images/flick.png") // 기본 이미지
//                                   as ImageProvider, // 데이터 타입
//                         ),
//                       ),
//                     ),

//                     SizedBox(height: screenHeight * 0.02),
//                     Text(
//                       memberInfo.nickname,
//                       style: const TextStyle(
//                         fontSize: 28,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     SizedBox(height: screenHeight * 0.04),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceAround,
//                       children: [
//                         _buildStatCard(
//                             Icons.calendar_today,
//                             '${memberInfo.ecoLifeDuration.toString()}일째',
//                             '진행중',
//                             screenWidth),
//                         _buildStatCard(
//                             Icons.event_available,
//                             memberInfo.recentChallengeTitle ?? '없음',
//                             '최근 실천 챌린지',
//                             screenWidth),
//                         _buildStatCard(
//                             Icons.access_time,
//                             "${memberInfo.totalActionCount}번",
//                             '누적 실천 횟수',
//                             screenWidth),
//                       ],
//                     ),
//                     const SizedBox(height: 20),
//                     BadgeWidget(count: memberInfo.score),
//                     const SizedBox(height: 50), // 추가 여백
//                   ],
//                 ),
//               ),
//             );
//           },
//           error: (message) => Center(child: Text('오류: $message')),
//         ),
//       ),
//     );
//   }

//   Widget _buildStatCard(
//       IconData icon, String stat, String description, double screenWidth) {
//     final double height = screenWidth * 0.40;

//     return Card(
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(12),
//       ),
//       elevation: 2,
//       child: SizedBox(
//         width: screenWidth * 0.25, // 넓이 조정
//         height: height,
//         child: Container(
//           padding: const EdgeInsets.all(8),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Icon(icon, size: 25, color: Colors.grey[400]),
//               const SizedBox(height: 10),
//               Text(
//                 stat,
//                 style: const TextStyle(
//                   fontSize: 16,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               const SizedBox(height: 5),
//               Text(
//                 description,
//                 style: TextStyle(
//                   fontSize: 12,
//                   color: Colors.grey[600],
//                 ),
//                 textAlign: TextAlign.center,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flick_frontend/common/const/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flick_frontend/members/provider/member_state.dart';
import 'package:flick_frontend/members/provider/members_provider.dart';
import 'package:flick_frontend/members/view/myPage/editMyProfile.dart';
import 'badgeWidget.dart';

class MyPageScreen2 extends ConsumerWidget {
  const MyPageScreen2({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profileState = ref.watch(membersProfileNotifierProvider);

    ref.listen<MemberProfileState>(membersProfileNotifierProvider,
        (previous, next) {
      next.maybeWhen(
        error: (message) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(message)),
          );
        },
        orElse: () {},
      );
    });

    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return SafeArea(
      child: profileState.when(
        initial: () {
          Future.microtask(() => ref
              .read(membersProfileNotifierProvider.notifier)
              .fetchMemberInfo());
          return const Center(child: CircularProgressIndicator());
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        loaded: (memberInfo) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: screenHeight * 0.05),
                  GestureDetector(
                    onTap: () async {
                      final result = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EditMyProfile(
                            profileImage: memberInfo.picture ??
                                "assets/images/flick.png", // 프로필 이미지 전달
                          ),
                        ),
                      );

                      if (result == true) {
                        ref
                            .read(membersProfileNotifierProvider.notifier)
                            .fetchMemberInfo(); // 최신 정보 로드
                      }
                    },
                    child: Container(
                      width: 160, // CircleAvatar 크기와 맞으기
                      height: 160, // CircleAvatar 크기와 맞으기
                      decoration: BoxDecoration(
                        shape: BoxShape.circle, // 원형 테두리
                        border: Border.all(
                          color: PRIMARY_COLOR, // 테두리 색상
                          width: 4.0, // 테두리 두길
                        ),
                      ),
                      child: CircleAvatar(
                        radius: 80, // 원형 이미지 크기
                        backgroundImage: memberInfo.picture != null
                            ? NetworkImage(memberInfo.picture!) // 네트워크 이미지
                            : const AssetImage(
                                    "assets/images/flick.png") // 기본 이미지
                                as ImageProvider, // 데이터 타입
                      ),
                    ),
                  ),

                  SizedBox(height: screenHeight * 0.02),
                  Text(
                    memberInfo.nickname,
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.04),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildStatCard(
                          Icons.calendar_today,
                          '${memberInfo.ecoLifeDuration.toString()}일째',
                          '진행중',
                          screenWidth),
                      _buildStatCard(
                          Icons.event_available,
                          memberInfo.recentChallengeTitle ?? '없음',
                          '최근 실천 챌린지',
                          screenWidth),
                      _buildStatCard(
                          Icons.access_time,
                          "${memberInfo.totalActionCount}번",
                          '누적 실천 횟수',
                          screenWidth),
                    ],
                  ),
                  const SizedBox(height: 20),
                  BadgeWidget(count: memberInfo.score),
                  const SizedBox(height: 50), // 추가 여배
                ],
              ),
            ),
          );
        },
        error: (message) => Center(child: Text('오류: $message')),
      ),
    );
  }

  Widget _buildStatCard(
      IconData icon, String stat, String description, double screenWidth) {
    final double height = screenWidth * 0.40;

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 2,
      child: SizedBox(
        width: screenWidth * 0.28, // 널리 조정
        height: height,
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 25, color: Colors.grey[400]),
              const SizedBox(height: 10),
              Text(
                stat,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
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
