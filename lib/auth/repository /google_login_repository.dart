import 'package:flick_frontend/auth/component/social_login.dart';
import 'package:flick_frontend/auth/model/token_model.dart';
import 'package:flick_frontend/auth/provider/auth_provider.dart';
import 'package:flick_frontend/auth/repository%20/auth_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleLoginRepository implements SocialLogin {
  final _googleSignIn = GoogleSignIn();
  final AuthRepository authRepository;

  GoogleLoginRepository(this.authRepository);

  @override
  Future<bool> login(WidgetRef ref) async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleAuth =
          await googleUser!.authentication;
      print('구글 로그인 idToken : ${googleAuth.idToken}');
      print('구글 로그인 성공1: ${googleAuth.accessToken}');
      print('구글 로그인 성공2: ${googleUser.displayName}');
      String idToken = googleAuth.idToken!;
      print('IdToken  : $idToken');
      _fetchTokens(idToken, ref);

      //  await fetchTokens(idToken);
    } catch (err) {
      print('Error during Google Login: $err');
    }
    return true;
  }

  @override
  Future<bool> logout() async {
    await _googleSignIn.signOut();
    return false;
  }

  Future<void> _fetchTokens(String idToken, WidgetRef ref) async {
    try {
      final response =
          await authRepository.requestAuthToken('google', {'idToken': idToken});

      final accessToken = response.data.accessToken;
      final refreshToken = response.data.refreshToken;

      ref.read(authProvider.notifier).updateToken(TokenData(
            accessToken: accessToken,
            refreshToken: refreshToken,
          ));
    } catch (e) {
      print('오류 발생: $e');
    }
  }
}
