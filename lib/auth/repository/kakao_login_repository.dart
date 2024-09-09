import 'package:flick_frontend/auth/component/social_login.dart';
import 'package:flick_frontend/auth/model/tokenResponse_model.dart';
import 'package:flick_frontend/auth/model/token_model.dart';

import 'package:flick_frontend/auth/provider/auth_provider.dart';
import 'package:flick_frontend/auth/repository/auth_repository.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';

class KakaoLoginRepository implements SocialLogin {
  final AuthRepository authRepository;
  bool isLogined = false;
  User? user;

  KakaoLoginRepository(this.authRepository);

  @override
  Future<bool> login(WidgetRef ref) async {
    try {
      bool isInstalled = await isKakaoTalkInstalled();
      OAuthToken authToken;
      if (isInstalled) {
        print('kakaoTalk is installed');
        authToken = await UserApi.instance.loginWithKakaoTalk();
      } else {
        print('kakaoTalk is not installed');
        authToken = await UserApi.instance.loginWithKakaoAccount();
      }

      String idToken = authToken.idToken!;
      print("======\n");
      print('idToken: $idToken');
      user = await UserApi.instance.me();
      try {
        isLogined = true;
        await _fetchTokens(idToken, ref);
        print('idToken :  $idToken');
      } catch (e) {
        'idToken 실패 : $e';
      }

      return isLogined;
    } catch (error) {
      print('카카오톡 로그인 실패: $error');
      isLogined = false;
      return isLogined;
    }
  }

  @override
  Future<bool> logout() async {
    try {
      await UserApi.instance.unlink();
      print('Successful to logout, Delete token');
      isLogined = false;
      return isLogined;
    } catch (error) {
      print('Failed to logout: $error');
      return true; // 여전히 로그인 상태
    }
  }

  Future<void> _fetchTokens(String idToken, WidgetRef ref) async {
    try {
      final response =
          await authRepository.requestAuthToken('kakao', {'idToken': idToken});
      final accessToken = response.data.accessToken;
      final refreshToken = response.data.refreshToken;
      ref.read(authProvider.notifier).updateToken(
          TokenData(accessToken: accessToken, refreshToken: refreshToken));
      print('AccessToken: $accessToken');
      print('RefreshToken: $refreshToken');
      // final refreshResponse = await authRepository
      //     .requestRefrechToken('kakao', {'idToken': idToken});
      // final accessResponse = await authRepository
      //     .requestAccessToken('kakao', {'idToken': idToken});

      // final refreshTokenResponse =
      //     TokenResponseModel.fromJson(refreshResponse.toJson());
      // final accessTokenResponse =
      //     TokenResponseModel.fromJson(accessResponse.toJson());

      // null 체크 추가
      // final tokenData = accessTokenResponse.data;
      // ref.read(authProvider.notifier).updateToken(tokenData);

      print("==========");
      print('AccessToken: $accessToken');
      print('RefreshToken: $refreshToken');
    } catch (error) {
      print('토큰 요청 실패: $error');
    }
  }
}
