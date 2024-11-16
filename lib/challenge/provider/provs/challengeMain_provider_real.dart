import 'package:dio/dio.dart';
import 'package:flick_frontend/challenge/repository/dio/challengeImageUpload_repository.dart';
import 'package:flick_frontend/challenge/repository/dio/challengeReports_repository.dart';
import 'package:flick_frontend/challenge/repository/service/challengeDetails_service_real.dart';
import 'package:flick_frontend/challenge/repository/dio/challenge_repository.dart';
import 'package:flick_frontend/challenge/repository/service/challenge_service_real.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

// ChallengeRepository를 사용할 수 있게 하는 provider(데이터를 API에서 가져오는 역할)
final challengeRepositoryProvider =
    Provider<ChallengeRepository>((ref) => ChallengeRepository(Dio()));

// challengeService를 사용할 수 있는 provider
final challengeServiceProvider = Provider<ChallengeService>((ref) {
  final challengeRepository = ref.watch(challengeRepositoryProvider);
  const storage = FlutterSecureStorage();
  final challengeReportsRepo = ChallengeReportsRepository(Dio());
  return ChallengeService(challengeRepository, storage, challengeReportsRepo);
});

final challengeDetailsServiceProvider =
    Provider<ChallengeDetailsService>((ref) {
  final challengeRepository = ref.watch(challengeRepositoryProvider);

  const storage = FlutterSecureStorage();
  final challengeImageUploadRepo = ChallengeImageUploadRepository(Dio());
  return ChallengeDetailsService(
      challengeRepository, storage, challengeImageUploadRepo);
});
