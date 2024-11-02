import 'package:flick_frontend/challenge/model/challengeInfo_model.dart';
import 'package:flick_frontend/challenge/provider/challengeMain_provider_real.dart';
import 'package:flick_frontend/challenge/repository/challengeDetails_service_real.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final challengeDetailsProvider =
    FutureProvider.family<ChallengeInfo?, int>((ref, challengeId) async {
  final challengeDetailsService = ref.watch(challengeDetailsServiceProvider);
  return await challengeDetailsService.fetchOpenDtails(challengeId);
});
