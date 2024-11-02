// 오픈챌린지 리스트를 받는 챌린지 프로바이더-> 전체 조회에 대한 챌린지
import 'package:flick_frontend/challenge/model/challengeInfo_model.dart';
import 'package:flick_frontend/challenge/provider/challengeMain_provider_real.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final openChallengeListProvider =
    FutureProvider<List<ChallengeInfo>>((ref) async {
  final challengeService = ref.watch(challengeServiceProvider);
  return await challengeService.fetchOpenChallengeList();
});
