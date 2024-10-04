import 'package:dio/dio.dart';
import 'package:flick_frontend/members/repository/membersOnboarding_repository.dart';
import 'package:flick_frontend/members/repository/members_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

// Dio 인스턴스를 제공하는 프로바이더
final dioProvider = Provider<Dio>((ref) {
  final dio = Dio(); // Dio 인스턴스 생성
  return dio;
});

// Secure Storage 인스턴스를 제공하는 프로바이더
final storageProvider = Provider<FlutterSecureStorage>((ref) {
  return const FlutterSecureStorage(); // Secure Storage 인스턴스 생성
});

// AuthService를 제공하는 프로바이더
final authServiceProvider = Provider<MembersRepository>((ref) {
  final dio = ref.watch(dioProvider); // Dio 인스턴스 가져오기
  return MembersRepository(dio); // AuthService 인스턴스 생성
});

// MembersRepository를 제공하는 프로바이더
final membersRepositoryProvider = Provider<MembersonboardingRepository>((ref) {
  final authService = ref.watch(authServiceProvider); // AuthService 인스턴스 가져오기
  final storage = ref.watch(storageProvider); // Secure Storage 인스턴스 가져오기
  return MembersonboardingRepository(
      authService, storage); // MembersRepository 인스턴스 생성
});
