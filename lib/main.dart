import 'package:flick_frontend/auth/view/login_screen.dart';
import 'package:flick_frontend/members/view/success_screen.dart';
// import 'package:flick_frontend/env.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'rank/view/rank_screen.dart';
import 'challenge/view/challenge_screen.dart';
import 'members/view/onBoarding_screen.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // var kakaoNativeAppKey = Env.kakaoNativeAppKey;
  // var kakaoJavaScriptKey = Env.kakaoJavaScriptKey;
  // KakaoSdk.init(
  //     nativeAppKey: kakaoNativeAppKey, javaScriptAppKey: kakaoJavaScriptKey);
  // runApp(const ProviderScope(child: InitializeView()));
}

class InitializeView extends StatelessWidget {
  const InitializeView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SuccessScreen(
        userName: "ckd",
      ),
      routes: {
        '/login': (context) => const LoginScreen(),
        '/rank': (context) => const RankScreen(),
        '/challenge': (context) => const ChallengeScreen(),
      },
    );
  }
}
