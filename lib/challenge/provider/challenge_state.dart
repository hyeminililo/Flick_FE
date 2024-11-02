// import 'package:flick_frontend/challenge/model/challengeInfo_model.dart';

// class ChallengeState {
//   final bool isLoading;
//   final List<ChallengeInfo> challenges;
//   final ChallengeInfo? selectedChallenge;
//   final String? error;
//   final int currentTab;

//   ChallengeState({
//     required this.isLoading,
//     required this.challenges,
//     this.selectedChallenge,
//     this.error,
//     required this.currentTab,
//   });

//   // 초기 상태
//   factory ChallengeState.initial() {
//     return ChallengeState(
//       isLoading: false,
//       challenges: [],
//       selectedChallenge: null,
//       error: null,
//       currentTab: 0,
//     );
//   }

//   // 상태 복사본 생성 (immutable copy)
//   ChallengeState copyWith({
//     bool? isLoading,
//     List<ChallengeInfo>? challenges,
//     ChallengeInfo? selectedChallenge,
//     String? error,
//     int? currentTab,
//   }) {
//     return ChallengeState(
//       isLoading: isLoading ?? this.isLoading,
//       challenges: challenges ?? this.challenges,
//       selectedChallenge: selectedChallenge ?? this.selectedChallenge,
//       error: error ?? this.error,
//       currentTab: currentTab ?? this.currentTab,
//     );
//   }
// }
