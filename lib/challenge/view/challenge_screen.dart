import 'package:flick_frontend/challenge/view/provider/challenge_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'myChallenge.dart';
import 'openChallenge.dart';
import '../../common/const/colors.dart';

class ChallengeScreen extends ConsumerWidget {
  const ChallengeScreen({super.key});
// 여기서 나중에 해당 그걸로 이동하면 될듯?
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
