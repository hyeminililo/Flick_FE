// import 'package:flick_frontend/challenge/repository/challengeList_service.dart';
// import 'package:flick_frontend/challenge/provider/challengeRepository_provider.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flick_frontend/challenge/model/challengeInfo_model.dart';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';

// // ChallengeService를 제공하는 Provider
// final challengeServiceProvider = Provider<ChallengeService>((ref) {
//   final challengeRepository = ref.watch(challengeRepositoryProvider);
//   final storage = FlutterSecureStorage();
//   return ChallengeService(challengeRepository, storage);
// });

// // 전체 챌린지 목록을 불러오는 Provider
// final myChallengesProvider = FutureProvider<List<ChallengeInfo>>((ref) async {
//   final challengeService = ref.watch(challengeServiceProvider);
//   return await challengeService.fetchChallengeList();
// });
