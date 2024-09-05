// import 'package:flick_frontend/auth/model/idToken_model.dart';
// import 'package:flick_frontend/auth/repository%20/auth_repository.dart';
// import 'package:flick_frontend/common/dio/uri.dart';
// import 'package:flick_frontend/auth/component/social_login.dart';
// import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';

// class KakaoLogin implements SocialLogin {
//   IdTokenModel idTokenModel = IdTokenModel();
//   final AuthRepository authRepository;

//   KakaoLogin(this.authRepository);
//   @override
//   Future<String> login() async {
//     try {
//       bool isInstalled = await isKakaoTalkInstalled();
//       if (isInstalled) {
//         print('kakaoTalk is installed ');
//         try {
//           OAuthToken authToken = await UserApi.instance.loginWithKakaoTalk();
//           idTokenModel.idToken = authToken.idToken;
//           print(idTokenModel.idToken);

//           return 'ok';
//         } catch (err) {
//           print(
//               "Kakao login failed while getting idToken issued when is Installed : $err");
//           return 'Failed to Login';
//         }
//       } else {
//         try {
//           print(KakaoSdk.logging);
//           print('kakaoTalk is not installed ');

//           final authCode = await AuthCodeClient.instance
//               .authorize(redirectUri: REDIRECT_URI);
//           print('AuthCode : $authCode');

//           final tokenResponse =
//               await authRepository.requestAccessToken('kakao', {
//             'id_token': idTokenModel.idToken!,
//           });
//           print('AccessToken: ${tokenResponse.accessToken}');
//           print('RefreshToken: ${tokenResponse.refreshToken}');
//           return 'ok';
//         } catch (err) {
//           print(
//               "Kakao login failed while getting idToken issued When is not Installed : $err");
//           return 'Failed to Login';
//         }
//       }
//     } catch (error) {
//       print('카카오톡 로그인 실패2 $error');

//       return 'Failed to Login';
//     }
//   }

//   @override
//   Future<bool> logout() async {
//     try {
//       await UserApi.instance.unlink();
//       print('Successful to logout, Delete token ');
//       return true;
//     } catch (error) {
//       print('Failed to logout : $error');
//       return false;
//     }
//   }
// }
