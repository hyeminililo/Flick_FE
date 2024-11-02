import 'package:flick_frontend/challenge/model/challengeInfo_model.dart';
import 'package:flick_frontend/challenge/provider/challengeMain_provider_real.dart';
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
