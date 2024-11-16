import 'package:flick_frontend/challenge/model/challengeInfo_model.dart';
import 'package:flick_frontend/challenge/model/picture/images_model.dart';
import 'package:flick_frontend/challenge/provider/provs/challengeMain_provider_real.dart';
import 'package:flick_frontend/challenge/repository/service/challengeDetails_service_real.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final challengeDetailsProvider =
    FutureProvider.family<ChallengeInfo?, int>((ref, challengeId) async {
  final challengeDetailsService = ref.watch(challengeDetailsServiceProvider);
  return await challengeDetailsService.fetchOpenDtails(challengeId);
});
// 챌린지 인증 사진 관리하는 프로바이더 
// final challengeDetailsImagesProvider =  