import 'package:flick_frontend/auth/view/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flick_frontend/env.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var kakaoNativeAppKey = Env.kakaoNativeAppKey;
  var kakaoJavaScriptKey = Env.kakaoJavaScriptKey;
  KakaoSdk.init(
      nativeAppKey: kakaoNativeAppKey, javaScriptAppKey: kakaoJavaScriptKey);
  runApp(
    ProviderScope(
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const LoginScreen(),
      ),
    ),
  );
}
