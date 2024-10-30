import 'package:flutter_riverpod/flutter_riverpod.dart';

// ChallengeState 클래스
class ChallengeState {
  final int currentIndex;

  ChallengeState(this.currentIndex);
}

// ChallengeNotifier 클래스
class ChallengeNotifier extends StateNotifier<ChallengeState> {
  ChallengeNotifier() : super(ChallengeState(0));

  void changeTab(int index) {
    state = ChallengeState(index);
  }
}

// Provider 생성
final challengeProvider =
    StateNotifierProvider<ChallengeNotifier, ChallengeState>((ref) {
  return ChallengeNotifier();
});
