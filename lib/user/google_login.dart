import 'package:flick_frontend/user/social_login.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleLogin implements SocialLogin {
  final _googleSignIn = GoogleSignIn();
  @override
  Future<bool> login() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication googleAuth =
          await googleUser!.authentication;

      final String? idToken = googleAuth.idToken;
      final String? acessToken = googleAuth.accessToken;
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
}
