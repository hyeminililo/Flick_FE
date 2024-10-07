import 'package:dio/dio.dart';
import 'package:flick_frontend/auth/model/auth_state.dart';
import 'package:flick_frontend/auth/model/token_model.dart';
import 'package:flick_frontend/auth/repository/auth_repository.dart';
import 'package:flick_frontend/auth/repository/google_login_repository.dart';
import 'package:flick_frontend/common/dio/uri.dart';
import 'package:flick_frontend/common/provider/dio_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../repository/kakao_login_repository.dart';

class AuthProvider extends StateNotifier<AuthState> {
  AuthProvider() : super(AuthState());

  void updateToken(TokenData tokenData) {
    state = state.copyWith(tokenData: tokenData);
  }

  void logout() {
    state = AuthState();
  }
}

final authProvider = StateNotifierProvider<AuthProvider, AuthState>((ref) {
  return AuthProvider();
});

final kakaoLgoinRepo =
    KakaoLoginRepository(AuthRepository(Dio(), baseUrl: BASE_URl));
final googleLoginRepo =
    GoogleLoginRepository(AuthRepository(Dio(), baseUrl: BASE_URl));

// // KakaoLoginRepository 제공
// final kakaoLoginRepositoryProvider = Provider<KakaoLoginRepository>((ref) {
//   final authRepository = ref.watch(authRepositoryProvider);
//   return KakaoLoginRepository(authRepository);
// });

// // GoogleLoginRepository 제공
// final googleLoginRepositoryProvider = Provider<GoogleLoginRepository>((ref) {
//   final authRepository = ref.watch(authRepositoryProvider);
//   return GoogleLoginRepository(authRepository);
// });

// // AuthRepository 제공
// final authRepositoryProvider = Provider<AuthRepository>((ref) {
//   final dio = ref.watch(dioProvider);
//   return AuthRepository(dio, baseUrl: BASE_URl); // BASE_URL 정의 필요
// });
