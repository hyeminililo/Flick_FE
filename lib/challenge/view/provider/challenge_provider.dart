import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flick_frontend/challenge/model/challenge.dart';

// FutureProvider 생성
final openChallengesProvider = FutureProvider<List<Challenge>>((ref) async {
  return await Future.delayed(const Duration(seconds: 2), () {
    return [
      Challenge(
        challengeId: 1,
        title: '비건 식단 도전하기',
        hashtag: ['#환경식사', '#차근차근', '#식물성음식'],
        contents: '환경을 위한 비건 식단에 도전해보세요!',
        imageUrl: 'assets/images/Error_Image_network.png',
        joinMembersCount: 1516,
      ),
      Challenge(
        challengeId: 2,
        title: '전기 아끼기',
        hashtag: ['#에너지절약', '#전기소비'],
        contents: '전기 절약 챌린지에 참가하세요!',
        imageUrl: 'assets/images/Error_Image_network.png',
        joinMembersCount: 1200,
      ),
      Challenge(
        challengeId: 3,
        title: '배달 줄이기',
        hashtag: ['#음식 절약', '#환경오염'],
        contents: '배달 절약 챌린지에 참가하세요!',
        imageUrl: 'assets/images/Error_Image_network.png',
        joinMembersCount: 3000,
      ),
    ];
  });
});

// MyChallenge를 위한 FutureProvider
final myChallengesProvider = FutureProvider<List<Challenge>>((ref) async {
  return await Future.delayed(const Duration(seconds: 2), () {
    return [
      Challenge(
        challengeId: 1,
        title: '비건 식단 도전하기',
        hashtag: ['#환경식사', '#차근차근', '#식물성음식'],
        contents: '환경을 위한 비건 식단에 도전해보세요!',
        imageUrl: 'assets/images/Error_Image_network.png',
        joinMembersCount: 1516,
      ),
      Challenge(
        challengeId: 2,
        title: '전기 아끼기',
        hashtag: ['#에너지절약', '#전기소비'],
        contents: '전기 절약 챌린지에 참가하세요!',
        imageUrl: 'assets/images/Error_Image_network.png',
        joinMembersCount: 1200,
      ),
    ];
  });
});
