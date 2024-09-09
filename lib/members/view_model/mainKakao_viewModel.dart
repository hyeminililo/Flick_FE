// import 'package:flick_frontend/auth/component/social_login.dart';
// import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';

// class MainViewModel {
//   final SocialLogin _socialLogin;
//   String isLogined = 'Failed to Login';
//   User? user;

//   MainViewModel(this._socialLogin);

//   Future login() async {
//     isLogined = await _socialLogin.login();
//     if (isLogined == 'ok') {
//       user = await UserApi.instance.me();
//     }
//   }

//   Future logout() async {
//     await _socialLogin.logout();
//     isLogined = 'Failed to Login';
//     user = null;
//   }
// }
