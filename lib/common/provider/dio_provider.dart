import 'package:dio/dio.dart';
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
