// // // import 'package:flick_frontend/members/provider/member_state.dart';
// // // import 'package:flick_frontend/members/provider/members_provider.dart';
// // // import 'package:flutter/material.dart';
// // // import 'package:flutter_riverpod/flutter_riverpod.dart';
// // // import 'package:flick_frontend/members/model/memberInfo_model.dart';

// // // class MyProfilePage extends ConsumerWidget {
// // //   const MyProfilePage({super.key});

// // //   @override
// // //   Widget build(BuildContext context, WidgetRef ref) {
// // //     final profileState = ref.watch(membersProfileNotifierProvider);

// // //     // 에러 상태를 감지하여 스낵바로 표시
// // //     ref.listen<MemberProfileState>(membersProfileNotifierProvider,
// // //         (previous, next) {
// // //       next.maybeWhen(
// // //         error: (message) {
// // //           ScaffoldMessenger.of(context).showSnackBar(
// // //             SnackBar(content: Text(message)),
// // //           );
// // //         },
// // //         orElse: () {},
// // //       );
// // //     });

// // //     return Scaffold(
// // //       appBar: AppBar(
// // //         title: const Text('마이페이지'),
// // //       ),
// // //       body: Center(
// // //         child: _buildContent(profileState, ref),
// // //       ),
// // //       floatingActionButton: FloatingActionButton(
// // //         onPressed: () {
// // //           // 사용자 정보 업데이트 (예시: 더미 데이터 사용)
// // //           final updatedInfo = MemberInfoModel(
// // //             id: 1,
// // //             email: 'newemail@example.com',
// // //             nickname: 'NewNickname',
// // //             // 필요한 필드 추가
// // //             picture: null,
// // //             school: null,
// // //             gradeClass: null,
// // //             type: null,
// // //             score: null,
// // //             ecoLifeDuration: null,
// // //             recentChallengeTitle: null,
// // //             totalActionCount: null,
// // //           );
// // //           ref
// // //               .read(membersProfileNotifierProvider.notifier)
// // //               .updateMemberInfo(updatedInfo);
// // //         },
// // //         child: const Icon(Icons.update),
// // //       ),
// // //     );
// // //   }

// // //   Widget _buildContent(MemberProfileState state, WidgetRef ref) {
// // //     return state.when(
// // //       initial: () {
// // //         // 초기 상태에서 데이터를 불러옴
// // //         ref.read(membersProfileNotifierProvider.notifier).fetchMemberInfo();
// // //         return const CircularProgressIndicator();
// // //       },
// // //       loading: () => const CircularProgressIndicator(),
// // //       loaded: (memberInfo) {
// // //         return Column(
// // //           mainAxisAlignment: MainAxisAlignment.center,
// // //           children: [
// // //             if (memberInfo.picture != null)
// // //               CircleAvatar(
// // //                 radius: 50,
// // //                 backgroundImage: NetworkImage(memberInfo.picture!),
// // //               ),
// // //             const SizedBox(height: 16),
// // //             Text('이메일: ${memberInfo.email}'),
// // //             Text('닉네임: ${memberInfo.nickname}'),
// // //             // 필요한 정보 추가
// // //           ],
// // //         );
// // //       },
// // //       error: (message) => Text('오류: $message'),
// // //     );
// // //   }
// // // }
// // import 'package:flick_frontend/members/provider/member_state.dart';
// // import 'package:flick_frontend/members/provider/members_provider.dart';
// // import 'package:flutter/material.dart';
// // import 'package:flutter_riverpod/flutter_riverpod.dart';
// // import 'package:flick_frontend/members/model/memberInfo_model.dart';

// // class MyProfilePage extends ConsumerWidget {
// //   const MyProfilePage({super.key});

// //   @override
// //   Widget build(BuildContext context, WidgetRef ref) {
// //     final profileState = ref.watch(membersProfileNotifierProvider);

// //     // 에러 상태를 감지하여 스낵바로 표시
// //     ref.listen<MemberProfileState>(membersProfileNotifierProvider,
// //         (previous, next) {
// //       next.maybeWhen(
// //         error: (message) {
// //           ScaffoldMessenger.of(context).showSnackBar(
// //             SnackBar(content: Text(message)),
// //           );
// //         },
// //         orElse: () {},
// //       );
// //     });

// //     return Scaffold(
// //       appBar: AppBar(
// //         title: const Text('마이페이지'),
// //       ),
// //       body: Center(
// //         child: _buildContent(profileState, ref),
// //       ),
// //       floatingActionButton: FloatingActionButton(
// //         onPressed: () {
// //           // 사용자 정보 업데이트 (예시: 더미 데이터 사용)
// //           final updatedInfo = MemberInfoModel(
// //             id: 1,
// //             email: 'newemail@example.com',
// //             nickname: 'NewNickname',
// //             // 필요한 필드 추가
// //             picture: null,
// //             school: null,
// //             gradeClass: null,
// //             type: null,
// //             score: null,
// //             ecoLifeDuration: null,
// //             recentChallengeTitle: null,
// //             totalActionCount: null,
// //           );
// //           ref
// //               .read(membersProfileNotifierProvider.notifier)
// //               .updateMemberInfo(updatedInfo);
// //         },
// //         child: const Icon(Icons.update),
// //       ),
// //     );
// //   }

// //   Widget _buildContent(MemberProfileState state, WidgetRef ref) {
// //     return state.when(
// //       initial: () {
// //         // 초기 상태에서 데이터를 불러옴
// //         ref.read(membersProfileNotifierProvider.notifier).fetchMemberInfo();
// //         return const CircularProgressIndicator();
// //       },
// //       loading: () => const CircularProgressIndicator(),
// //       loaded: (memberInfo) {
// //         return Column(
// //           mainAxisAlignment: MainAxisAlignment.center,
// //           children: [
// //             if (memberInfo.picture != null)
// //               CircleAvatar(
// //                 radius: 50,
// //                 backgroundImage: NetworkImage(memberInfo.picture!),
// //               ),
// //             const SizedBox(height: 16),
// //             Text('이메일: ${memberInfo.email}'),
// //             Text('닉네임: ${memberInfo.nickname}'),
// //             // 필요한 정보 추가
// //           ],
// //         );
// //       },
// //       error: (message) => Text('오류: $message'),
// //     );
// //   }
// // }
import 'package:flick_frontend/members/model/memberInfo_model.dart';
import 'package:flick_frontend/members/provider/member_state.dart';
import 'package:flick_frontend/members/provider/members_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// class MyProfilePage extends ConsumerWidget {
//   const MyProfilePage({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final profileState = ref.watch(membersProfileNotifierProvider);

//     // 에러 상태를 감지하여 스낵바로 표시
//     ref.listen<MemberProfileState>(membersProfileNotifierProvider,
//         (previous, next) {
//       next.maybeWhen(
//         error: (message) {
//           ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(content: Text("에러: $message")),
//           );
//         },
//         orElse: () {},
//       );
//     });

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('마이페이지'),
//       ),
//       body: Center(
//         child: _buildContent(profileState, ref),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           // 사용자 정보 업데이트 (예시: 더미 데이터 사용)
//           final updatedInfo = MemberInfoModel(
//             id: 1,
//             email: 'newemail@example.com',
//             nickname: 'NewNickname',
//             picture: null,
//             school: null,
//             gradeClass: null,
//             type: null,
//             score: null,
//             ecoLifeDuration: null,
//             recentChallengeTitle: null,
//             totalActionCount: null,
//           );

//           // 이전 상태가 로딩 중일 경우 업데이트 중복 방지
//           if (profileState is! MemberProfileLoading) {
//             ref
//                 .read(membersProfileNotifierProvider.notifier)
//                 .updateMemberInfo(updatedInfo);
//           }
//         },
//         child: const Icon(Icons.update),
//       ),
//     );
//   }

//   Widget _buildContent(MemberProfileState state, WidgetRef ref) {
//     return state.when(
//       initial: () {
//         // 초기 상태에서 데이터를 불러옴
//         Future.microtask(() => ref
//             .read(membersProfileNotifierProvider.notifier)
//             .fetchMemberInfo());
//         return const CircularProgressIndicator();
//       },
//       loading: () => const CircularProgressIndicator(),
//       loaded: (memberInfo) {
//         return Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             if (memberInfo.picture != null)
//               CircleAvatar(
//                 radius: 50,
//                 backgroundImage: NetworkImage(memberInfo.picture!),
//               ),
//             const SizedBox(height: 16),
//             Text('이메일: ${memberInfo.email}'),
//             Text('닉네임: ${memberInfo.nickname}'),
//           ],
//         );
//       },
//       error: (message) => Text('오류: $message'),
//     );
//   }
// }
class MyProfilePage extends ConsumerWidget {
  const MyProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // membersProfileNotifierProvider의 현재 상태를 감시 (watch)하여 받아옴
    final profileState = ref.watch(membersProfileNotifierProvider);

    // 상태 변화 감지 리스너 설정: 에러 상태일 때 스낵바로 에러 메시지 출력
    ref.listen<MemberProfileState>(membersProfileNotifierProvider,
        (previous, next) {
      next.maybeWhen(
        error: (message) {
          // 에러 상태 발생 시, 스낵바로 메시지 표시
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(message)),
          );
        },
        orElse: () {},
      );
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text('마이페이지'), // 상단 바 제목 설정
      ),
      body: Center(
        // 현재 상태에 따라 다른 화면을 렌더링하는 함수 호출
        child: _buildContent(profileState, ref),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // 플로팅 버튼을 눌렀을 때 사용자 정보를 업데이트하는 로직
          final updatedInfo = MemberInfoModel(
            id: 1,
            email: 'newemail@example.com',
            nickname: 'NewNickname',
            // 기타 필드 초기화
            picture: null,
            school: null,
            gradeClass: null,
            type: null,
            score: null,
            ecoLifeDuration: null,
            recentChallengeTitle: null,
            totalActionCount: null,
          );

          // 상태 관리 객체를 통해 정보 업데이트
          // 이전 상태가 로딩 중일 경우 업데이트 중복 방지
          if (profileState is! MemberProfileLoading) {
            ref
                .read(membersProfileNotifierProvider.notifier)
                .updateMemberInfo(updatedInfo);
          }
        },
        child: const Icon(Icons.update), // 버튼 아이콘 설정
      ),
    );
  }

  Widget _buildContent(MemberProfileState state, WidgetRef ref) {
    return state.when(
      initial: () {
        // 초기 상태에서 데이터를 불러옴
        Future.microtask(() => ref
            .read(membersProfileNotifierProvider.notifier)
            .fetchMemberInfo());
        return const CircularProgressIndicator();
      },
      loading: () => const CircularProgressIndicator(),
      loaded: (memberInfo) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (memberInfo.picture != null)
              CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(memberInfo.picture!),
              ),
            const SizedBox(height: 16),
            Text('이메일: ${memberInfo.email}'),
            Text('닉네임: ${memberInfo.nickname}'),
          ],
        );
      },
      error: (message) => Text('오류: $message'),
    );
  }
}
