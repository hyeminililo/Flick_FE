// import 'package:flick_frontend/challenge/provider/challenge_state.dart';
// import 'package:flick_frontend/challenge/repository/challengeList_service.dart';
// import 'package:flick_frontend/challenge/provider/mycahllenge_provider.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// final challengeProvider =
//     StateNotifierProvider<ChallengeNotifier, ChallengeState>((ref) {
//   final challengeService = ref.watch(challengeServiceProvider);
//   return ChallengeNotifier(challengeService);
// });

// class ChallengeNotifier extends StateNotifier<ChallengeState> {
//   final ChallengeService _challengeService;

//   ChallengeNotifier(this._challengeService) : super(ChallengeState.initial());

//   // 전체 챌린지 리스트 불러오기
//   Future<void> loadChallengeList() async {
//     state = state.copyWith(isLoading: true);

//     try {
//       final challenges = await _challengeService.fetchChallengeList();
//       state = state.copyWith(isLoading: false, challenges: challenges);
//     } catch (e) {
//       state = state.copyWith(isLoading: false, error: e.toString());
//     }
//   }

//   // 단일 챌린지 상세 정보 불러오기
//   Future<void> loadChallengeDetails(int challengeId) async {
//     state = state.copyWith(isLoading: true);

//     try {
//       final challengeDetails =
//           await _challengeService.fetchChallengeDetails(challengeId);
//       state =
//           state.copyWith(isLoading: false, selectedChallenge: challengeDetails);
//     } catch (e) {
//       state = state.copyWith(isLoading: false, error: e.toString());
//     }
//   }

//   // 탭 변경
//   void changeTab(int index) {
//     state = state.copyWith(currentTab: index);
//   }
// }
