// import 'package:dio/dio.dart';
// import 'package:flick_frontend/auth/model/auth_state.dart';
// import 'package:flick_frontend/auth/model/token_model.dart';
// import 'package:flick_frontend/auth/repository/auth_repository.dart';
// import 'package:flick_frontend/auth/repository/google_login_repository.dart';
// import 'package:flick_frontend/common/dio/uri.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// import '../repository/kakao_login_repository.dart';

// class AuthProvider extends StateNotifier<AuthState> {
//   AuthProvider() : super(AuthState());

//   void updateToken(TokenData tokenData) {
//     state = state.copyWith(tokenData: tokenData);
//   }

//   void logout() {
//     state = AuthState();
//   }
// }

// final authProvider = StateNotifierProvider<AuthProvider, AuthState>((ref) {
//   return AuthProvider();
// });

// final kakaoLgoinRepo =
//     KakaoLoginRepository(AuthRepository(Dio(), baseUrl: BASE_URl));
// final googleLoginRepo =
//     GoogleLoginRepository(AuthRepository(Dio(), baseUrl: BASE_URl));
import 'package:dio/dio.dart';
import 'package:flick_frontend/auth/repository/google_login_repository.dart';
import 'package:flick_frontend/auth/repository/kakao_login_repository.dart';
import 'package:flick_frontend/common/dio/uri.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flick_frontend/auth/model/auth_state.dart';
import 'package:flick_frontend/auth/model/token_model.dart';
import 'package:flick_frontend/auth/repository/auth_repository.dart';

class AuthProvider extends StateNotifier<AuthState> {
  final FlutterSecureStorage secureStorage = const FlutterSecureStorage();

  AuthProvider() : super(AuthState()) {
    _loadToken();
  }

  Future<void> _loadToken() async {
    final accessToken = await secureStorage.read(key: "accessToken");
    final refreshToken = await secureStorage.read(key: "refreshToken");
    if (accessToken != null && refreshToken != null) {
      updateToken(TokenData(
        accessToken: accessToken,
        refreshToken: refreshToken,
      ));
    }
  }

  Future<void> saveToken(TokenData tokenData) async {
    await secureStorage.write(key: "accessToken", value: tokenData.accessToken);
    await secureStorage.write(
        key: "refreshToken", value: tokenData.refreshToken);
    updateToken(tokenData);
  }

  void updateToken(TokenData tokenData) {
    state = state.copyWith(tokenData: tokenData);
  }

  void logout() async {
    await secureStorage.deleteAll();
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
