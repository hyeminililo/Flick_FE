// import 'package:flick_frontend/auth/repository%20/auth_repository.dart';
// import 'package:flick_frontend/auth/component/social_login.dart';
// import 'package:google_sign_in/google_sign_in.dart';

// class GoogleLogin implements SocialLogin {
//   final _googleSignIn = GoogleSignIn();
//   final AuthRepository authRepository;
//   GoogleLogin(this.authRepository);

//   @override
//   Future<String> login() async {
//     try {
//       final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
//       final GoogleSignInAuthentication googleAuth =
//           await googleUser!.authentication;
//       print('구글 로그인 idToken : ${googleAuth.idToken}');
//       print('구글 로그인 성공1: ${googleAuth.accessToken}');
//       print('구글 로그인 성공2: ${googleUser.displayName}');
//       String idToken = googleAuth.idToken!;
//       await fetchTokens(idToken);
//     } catch (err) {
//       print('Error during Google Login: $err');
//     }
//     return 'ok';
//   }

//   @override
//   Future<bool> logout() async {
//     await _googleSignIn.signOut();
//     return false;
//   }

//   Future<void> fetchTokens(String idToken) async {
//     final refreshToken =
//         authRepository.requestRefrechToken('google', {'id_token': idToken});
//     final accessToken =
//         authRepository.requestAccessToken('google', {'id_token': idToken});

//     print('AccessToken : $accessToken');
//     print('RefreshToken : $refreshToken');
//   }
// }
