import 'package:flick_frontend/challenge/model/challengeInfo_model.dart';
import 'package:flick_frontend/challenge/model/picture/images_model.dart';
import 'package:flick_frontend/challenge/provider/challengeMain_provider_real.dart';
import 'package:flick_frontend/challenge/repository/challenge_service_real.dart';
import 'package:flick_frontend/members/model/members_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final mychallengeListProvider =
    FutureProvider<List<ChallengeInfo>>((ref) async {
  final challengeService = ref.watch(challengeServiceProvider);
  return await challengeService.fetchMyChallenge();
});

final challengeTypeProvider = FutureProvider<UserType>((ref) async {
  final challengeService = ref.watch(challengeServiceProvider);
  return await challengeService.devideType() ?? UserType.GENERAL;
});

// d여기부터 다시 볻기
final challengeImagesProvider =
    FutureProvider.family<ImageUrls?, ChallengeImageParams>(
        (ref, params) async {
  final challengeDetailsService = ref.watch(challengeDetailsServiceProvider);
  return await challengeDetailsService.fetchChallengeImages(
      params.challengeId, params.month, params.day);
});

class ChallengeImageParams {
  final int challengeId;
  final int month;
  final int day;

  ChallengeImageParams({
    required this.challengeId,
    required this.month,
    required this.day,
  });
}
