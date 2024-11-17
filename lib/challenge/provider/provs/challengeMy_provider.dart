import 'package:flick_frontend/challenge/model/challengeInfo_model.dart';
import 'package:flick_frontend/challenge/model/picture/images_model.dart';
import 'package:flick_frontend/challenge/model/picture/memberPictureUrls_model.dart';
import 'package:flick_frontend/challenge/provider/provs/challengeMain_provider_real.dart';
import 'package:flick_frontend/challenge/repository/service/challenge_service_real.dart';
import 'package:flick_frontend/members/model/members_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// 마이챌린지 리스트 같은데
final mychallengeListProvider =
    FutureProvider<List<ChallengeInfo>>((ref) async {
  final challengeService = ref.watch(challengeServiceProvider);
  return await challengeService.fetchMyChallenge();
});

final challengeTypeProvider = FutureProvider<UserType>((ref) async {
  final challengeService = ref.watch(challengeServiceProvider);
  return await challengeService.devideType() ?? UserType.GENERAL;
});

final challengeImagesProvider =
    FutureProvider.family<ImageUrls?, ChallengeImageParams>(
  (ref, params) async {
    final challengeDetailsService = ref.watch(challengeDetailsServiceProvider);

    try {
      // 이게 받을 때만 해야하는건가
      final temp = await challengeDetailsService.fetchChallengeImages(
        params.challengeId,
        params.month,
        params.day,
      );

      // 디버깅 로그
      if (temp == null) {
        print("[Error]: fetchChallengeImages가 null을 반환했습니다.");
      } else {
        print("Provider가 받은 데이터: ${temp.imageUrls}");
      }

      return temp; // ImageUrls 객체 반환
    } catch (e) {
      print("[Error in Provider]: $e");
      return null;
    }
  },
);

class ChallengeImageParams {
  final int challengeId;
  final int month;
  final int day;

  // 생성자에서 기본값 설정
  ChallengeImageParams({
    this.challengeId = 1, // 예시 기본값
    int? month,
    int? day,
  })  : month = month ?? DateTime.now().month,
        day = day ?? DateTime.now().day;
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ChallengeImageParams &&
        other.challengeId == challengeId &&
        other.month == month &&
        other.day == day;
  }

  @override
  int get hashCode => challengeId.hashCode ^ month.hashCode ^ day.hashCode;
}

final challengeAuthImagesProvider =
    FutureProvider.family<MemberPictureUrls?, ChallengeImageParams>(
        (ref, params) async {
  final challengeDetailsService = ref.watch(challengeDetailsServiceProvider);
  final challengeAuthResult =
      await challengeDetailsService.fetchUserChallengeAuthImages(
          params.challengeId, params.month, params.day);
  print("챌린지 Auth 리스트입니다 : ${challengeAuthResult!.memberPictureUrls}");
  return challengeAuthResult;
});
