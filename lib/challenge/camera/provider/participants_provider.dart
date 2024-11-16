import 'package:flick_frontend/challenge/provider/provs/challengeMy_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flick_frontend/challenge/provider/provs/challengeMain_provider_real.dart';

// joinMembersCountProvider 정의: 특정 challengeId에 대해 joinMembersCount만을 가져오는 Provider
final joinMembersCountProvider =
    FutureProvider.family<int?, int>((ref, challengeId) async {
  final challengeService = ref.read(challengeDetailsServiceProvider);
  final challengeInfo = await challengeService.fetchOpenDtails(challengeId);
  return challengeInfo?.joinMembersCount;
});

// 상태 클래스 정의
class ParticipantsState {
  final int count;
  final List<String> memberPictureUrls;

  ParticipantsState({required this.count, required this.memberPictureUrls});
}

// 상태를 관리하는 Notifier 정의
class ParticipantsNotifier extends StateNotifier<ParticipantsState> {
  final Ref ref; // Ref로 변경

  ParticipantsNotifier(this.ref)
      : super(ParticipantsState(count: 0, memberPictureUrls: []));

  // 인증된 챌린지 이미지를 가져오고 joinMembersCountProvider를 활용해 참여자 수를 가져오는 메서드
  Future<void> fetchParticipants(int challengeId, int month, int day) async {
    // joinMembersCountProvider를 통해 참여자 수 가져오기
    final joinMembersCount =
        await ref.read(joinMembersCountProvider(challengeId).future);

    // challengeImagesProvider를 사용해 서버에서 인증된 챌린지 이미지 데이터 가져오기
    final imageUrls = await ref.read(
      challengeImagesProvider(ChallengeImageParams(
        challengeId: challengeId,
        month: month,
        day: day,
      )).future,
    );

    // 참여자 수(joinMembersCount)와 인증된 이미지 리스트를 상태로 업데이트
    state = ParticipantsState(
      // count: joinMembersCount ?? imageUrls?.data.length ?? 0,
      // memberPictureUrls: imageUrls?.data.map((url) => url.url).toList() ?? [],
      count: joinMembersCount ?? imageUrls?.imageUrls.length ?? 0,
      memberPictureUrls: imageUrls?.imageUrls.map((url) => url).toList() ?? [],
    );
  }
}

// Notifier의 상태를 제공하는 Provider-> 이걸로 다른 곳에서 참가자 프로바이더 제공
final participantsProvider =
    StateNotifierProvider<ParticipantsNotifier, ParticipantsState>((ref) {
  return ParticipantsNotifier(ref);
});
