import 'package:flutter_riverpod/flutter_riverpod.dart';

// 프로필 데이터 모델
class ProfileData {
  final String profileImage;
  final String name;
  final String stat1;
  final String stat2;
  final String stat3;
  final int badgeCount;

  ProfileData({
    required this.profileImage,
    required this.name,
    required this.stat1,
    required this.stat2,
    required this.stat3,
    required this.badgeCount,
  });
}

// 프로필 프로바이더 정의
final profileProvider = StateProvider<ProfileData>((ref) {
  return ProfileData(
    profileImage: 'assets/images/google.png',
    name: '홍길동',
    stat1: '17일째',
    stat2: '텀블러 사용',
    stat3: '123번',
    badgeCount: 300,
  );
});
