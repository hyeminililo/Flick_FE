import 'package:flick_frontend/challenge/model/challengeInfo_model.dart';
import 'package:flick_frontend/challenge/provider/provs/challengeMain_provider_real.dart';
import 'package:flick_frontend/challenge/provider/provs/challengeMy_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final challengeDetailsProvider =
    FutureProvider.family<ChallengeInfo?, int>((ref, challengeId) async {
  final challengeDetailsService = ref.watch(challengeDetailsServiceProvider);
  return await challengeDetailsService.fetchOpenDtails(challengeId);
});

final userChallengeAuthImagesCountProvider =
    FutureProvider.family<int, ChallengeImageParams>((ref, params) async {
  final challengeDetailsService = ref.watch(challengeDetailsServiceProvider);

  try {
    final response = await challengeDetailsService.fetchUserChallengeAuthImages(
      params.challengeId,
      params.month,
      params.day,
    );

    if (response?.memberPictureUrls != null) {
      return response!.memberPictureUrls.length;
    } else {
      return 0;
    }
  } catch (e) {
    print("[Error]: $e");
    return 0;
  }
});
