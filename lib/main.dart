import 'package:flick_frontend/env.dart';
import 'package:flick_frontend/members/view/google_login_screen.dart';
import 'package:flutter/material.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var kakaoNativeAppKey = Env.kakaoNativeAppKey;
  var kakaoJavaScriptKey = Env.kakaoJavaScriptKey;
  KakaoSdk.init(
      nativeAppKey: kakaoNativeAppKey, javaScriptAppKey: kakaoJavaScriptKey);
  runApp(const KakaoLogin_view());
}

class KakaoLogin_view extends StatelessWidget {
  const KakaoLogin_view({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const GoogleLoginScreen(title: ''));
  }
}
