// CustomInterceptor 클래스 정의
import 'package:dio/dio.dart';
import 'package:flick_frontend/auth/provider/auth_provider.dart';
import 'package:flick_frontend/common/const/data.dart';
import 'package:flick_frontend/common/dio/uri.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart'
    hide Options;

class CustomInterceptor extends Interceptor {
  final FlutterSecureStorage storage; // Secure Storage 인스턴스
  final Ref ref; // Riverpod의 Ref

  CustomInterceptor({
    required this.storage,
    required this.ref,
  });

  // 1) 요청을 보낼 때
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
      if (token != null) {
        options.headers.addAll({
          'authorization': 'Bearer $token',
        });
      }
    }

    // refreshToken이 true인 경우
    if (options.headers['refreshToken'] == 'true') {
      options.headers.remove('refreshToken'); // 헤더에서 refreshToken 제거
      final token =
          await storage.read(key: REFRESH_TOKEN_KEY); // Secure Storage에서 토큰 읽기

      // 실제 토큰으로 대체
      if (token != null) {
        options.headers.addAll({
          'authorization': 'Bearer $token',
        });
      }
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

  // 3) 에러가 났을 때
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    print(
        '[ERR] [${err.requestOptions.method}] ${err.requestOptions.uri}'); // 에러 로그 출력

    final refreshToken =
        await storage.read(key: REFRESH_TOKEN_KEY); // Refresh Token 읽기

    // refreshToken이 없으면 에러 던짐
    if (refreshToken == null) {
      return handler.reject(err); // 에러를 거부
    }

    // 401 에러 확인
    final isStatus401 = err.response?.statusCode == 401;
    // 요청 경로가 토큰을 리프레시하는 경로인지 확인
    final isPathRefresh = err.requestOptions.path == '/auth/token';

    // 401 에러가 맞고, 리프레시 요청이 아닌 경우
    if (isStatus401 && !isPathRefresh) {
      final dio = Dio(); // 새로운 Dio 인스턴스 생성

      try {
        final body = {
          'refreshToken': refreshToken, // 실제 리프레시 토큰 사용
        };

        final resp = await dio.post('$BASE_URl/token/access', // 토큰 요청
            options: Options(
              headers: {
                'accept': '*/*', // accept 헤더 추가
                'Content-Type': 'application/json', // Content-Type 헤더 추가
              },
            ),
            data: body);

        final accessToken = resp.data['accessToken']; // 새로운 accessToken 가져오기
        final options = err.requestOptions; // 원래 요청 옵션 가져오기

        // 변경한 토큰으로 헤더 업데이트
        options.headers.addAll({
          'authorization': 'Bearer $accessToken',
        });

        // 새로운 토큰을 Secure Storage에 저장
        await storage.write(key: ACCESS_TOKEN_KEY, value: accessToken);

        // 요청 재전송
        final response = await dio.fetch(options);
        return handler.resolve(response); // 요청 성공으로 처리
      } on DioException catch (e) {
        ref.read(authProvider.notifier).logout(); // 로그아웃 처리
        return handler.reject(e); // 에러 던지기
      }
    }

    return handler.reject(err); // 에러를 거부
  }
}
