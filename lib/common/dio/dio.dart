import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

final dioProvider = Provider<Dio>((ref) {
  final dio = Dio();
  final storage = ref.watch(secureStorageProvider);
  dio.interceptors.add(CustomInterceptor(storage: storage, ref: ref));
  return dio;
});

class CustomInterceptor extends Interceptor {
  final FlutterSecureStorage storage;
  final Ref ref;
  CustomInterceptor({
    required this.storage,
    required this.ref,
  });
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    print('[REQ] [${options.method}] ${options.uri}'); // 요청 로그 출력

    // accessToken이 true인 경우
    if (options.headers['accessToken'] == 'true') {
      options.headers.remove('accessToken'); // 헤더에서 accessToken 제거
      final token =
          await storage.read(key: ACCESS_TOKEN_KEY); // Secure Storage에서 토큰 읽기

      // 실제 토큰으로 대체
      options.headers.addAll({
        'authorization': 'Bearer $token',
      });
    }

    // refreshToken이 true인 경우
    if (options.headers['refreshToken'] == 'true') {
      options.headers.remove('refreshToken'); // 헤더에서 refreshToken 제거
      final token =
          await storage.read(key: REFRESH_TOKEN_KEY); // Secure Storage에서 토큰 읽기

      // 실제 토큰으로 대체
      options.headers.addAll({
        'authorization': 'Bearer $token',
      });
    }

    return super.onRequest(options, handler); // 요청 처리 계속 진행
  }

  // 2) 응답을 받을 때
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    print(
        '[RES] [${response.requestOptions.method}] ${response.requestOptions.uri}'); // 응답 로그 출력
    return super.onResponse(response, handler); // 응답 처리 계속 진행
  }
}
