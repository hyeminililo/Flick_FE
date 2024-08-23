import 'package:flick_frontend/env.dart';
import 'package:flick_frontend/user/view/kakaoLogin.dart';
import 'package:flutter/material.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';

void main() async {
  // await dotenv.load(fileName: 'assets/config/dev.env');
  WidgetsFlutterBinding.ensureInitialized();
  // String? kakaoNativeKey = dotenv.env['KAKAO_NATIVE_KEY'];
  // await FlutterConfig.loadEnvVariables();
  var kakaoNativeAppKey = Env.kakaoNativeAppKey;
  KakaoSdk.init(nativeAppKey: kakaoNativeAppKey);
//  KakaoSdk.init(nativeAppKey: kakaoNativeKey);
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
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
