import 'package:flick_frontend/members/model/members_model.dart';
import 'package:flick_frontend/ranking/view/generalRank_screen.dart';
import 'package:flick_frontend/ranking/view/studentRank_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flick_frontend/members/provider/members_provider.dart';

class RankScreen extends ConsumerWidget {
  const RankScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profileState = ref.watch(membersProfileNotifierProvider);

    return profileState.when(
      initial: () => const Center(child: CircularProgressIndicator()),
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (message) => Center(child: Text('에러 발생: $message')),
      loaded: (memberInfo) {
        // 유저 타입에 따라 화면 분기
        if (memberInfo.type == UserType.GENERAL) {
          return const GeneralRankScreen(); // 일반 랭킹 화면
        } else if (memberInfo.type == UserType.STUDENT) {
          return const StudentRankScreen(); // 학생 랭킹 화면
        } else {
          return const Center(child: Text('알 수 없는 유저 타입입니다.'));
        }
      },
    );
  }
}
