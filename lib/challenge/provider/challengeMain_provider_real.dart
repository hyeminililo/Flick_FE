import 'package:dio/dio.dart';
import 'package:flick_frontend/challenge/repository/challengeDetails_service_real.dart';
import 'package:flick_frontend/challenge/repository/challenge_repository.dart';
import 'package:flick_frontend/challenge/repository/challenge_service_real.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

// ChallengeRepository를 사용할 수 있게 하는 provider(데이터를 API에서 가져오는 역할)
final challengeRepositoryProvider =
    Provider<ChallengeRepository>((ref) => ChallengeRepository(Dio()));

final challengeServiceProvider = Provider<ChallengeService>((ref) {
  final challengeRepository = ref.watch(challengeRepositoryProvider);
  const storage = FlutterSecureStorage();

  return ChallengeService(challengeRepository, storage);
});

final challengeDetailsServiceProvider =
    Provider<ChallengeDetailsService>((ref) {
  final challengeRepository = ref.watch(challengeRepositoryProvider);
  const storage = FlutterSecureStorage();

  return ChallengeDetailsService(challengeRepository, storage);
});
