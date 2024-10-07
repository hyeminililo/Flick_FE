// import 'package:flick_frontend/members/provider/member_state.dart';
// import 'package:flick_frontend/members/provider/members_provider.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flick_frontend/members/model/memberInfo_model.dart';

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
//             SnackBar(content: Text(message)),
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
//             // 필요한 필드 추가
//             picture: null,
//             school: null,
//             gradeClass: null,
//             type: null,
//             score: null,
//             ecoLifeDuration: null,
//             recentChallengeTitle: null,
//             totalActionCount: null,
//           );
//           ref
//               .read(membersProfileNotifierProvider.notifier)
//               .updateMemberInfo(updatedInfo);
//         },
//         child: const Icon(Icons.update),
//       ),
//     );
//   }

//   Widget _buildContent(MemberProfileState state, WidgetRef ref) {
//     return state.when(
//       initial: () {
//         // 초기 상태에서 데이터를 불러옴
//         ref.read(membersProfileNotifierProvider.notifier).fetchMemberInfo();
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
//             // 필요한 정보 추가
//           ],
//         );
//       },
//       error: (message) => Text('오류: $message'),
//     );
//   }
// }
import 'package:flick_frontend/members/provider/member_state.dart';
import 'package:flick_frontend/members/provider/members_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flick_frontend/members/model/memberInfo_model.dart';

class MyProfilePage extends ConsumerWidget {
  const MyProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profileState = ref.watch(membersProfileNotifierProvider);

    // 에러 상태를 감지하여 스낵바로 표시
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

    return Scaffold(
      appBar: AppBar(
        title: const Text('마이페이지'),
      ),
      body: Center(
        child: _buildContent(profileState, ref),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // 사용자 정보 업데이트 (예시: 더미 데이터 사용)
          final updatedInfo = MemberInfoModel(
            id: 1,
            email: 'newemail@example.com',
            nickname: 'NewNickname',
            // 필요한 필드 추가
            picture: null,
            school: null,
            gradeClass: null,
            type: null,
            score: null,
            ecoLifeDuration: null,
            recentChallengeTitle: null,
            totalActionCount: null,
          );
          ref
              .read(membersProfileNotifierProvider.notifier)
              .updateMemberInfo(updatedInfo);
        },
        child: const Icon(Icons.update),
      ),
    );
  }

  Widget _buildContent(MemberProfileState state, WidgetRef ref) {
    return state.when(
      initial: () {
        // 초기 상태에서 데이터를 불러옴
        ref.read(membersProfileNotifierProvider.notifier).fetchMemberInfo();
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
            // 필요한 정보 추가
          ],
        );
      },
      error: (message) => Text('오류: $message'),
    );
  }
}
