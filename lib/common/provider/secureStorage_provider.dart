import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// FlutterSecureStorage 인스턴스를 제공하는 Provider
final secureStorageProvider = Provider<FlutterSecureStorage>((ref) {
  return const FlutterSecureStorage(); // FlutterSecureStorage 인스턴스 생성
});
