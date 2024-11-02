import 'package:dio/dio.dart';
import 'package:flick_frontend/challenge/model/challengeInfo_model.dart';
import 'package:flick_frontend/challenge/repository/challengeList_service.dart';
import 'package:flick_frontend/challenge/repository/challenge_repository.dart';
import 'package:flick_frontend/challenge/repository/challenge_service_real.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

// ChallengeRepository를 사용할 수 있게 하는 provider(데이터를 API에서 가져오는 역할)
final challengeRepositoryProvider = Provider<ChallengeRepository>((ref) {
  return ChallengeRepository(Dio());
});

final challengeServiceProvider = Provider<ChallengeService>((ref) {
  final challengeRepository = ref.watch(challengeRepositoryProvider);
  const storage = FlutterSecureStorage();
  return ChallengeService(challengeRepository, storage);
});

// 오픈챌린지 리스트를 받는 챌린지 프로바이더-> 전체 조회에 대한 챌린지
final openChallengeListProvider =
    FutureProvider<List<ChallengeInfo>>((ref) async {
  final challengeService = ref.watch(challengeServiceProvider);
  return await challengeService.fetchOpenChallengeList();
});

final mychallengeListProvider =
    FutureProvider<List<ChallengeInfo>>((ref) async {
  final challengeService = ref.watch(challengeServiceProvider);
  return await challengeService.fetchMyChallenge();
});
