import 'package:camera/camera.dart';
import 'package:flick_frontend/auth/view/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flick_frontend/env.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';

final cameraProvider = Provider<CameraController>((ref) {
  throw UnimplementedError();
});

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var kakaoNativeAppKey = Env.kakaoNativeAppKey;
  var kakaoJavaScriptKey = Env.kakaoJavaScriptKey;
  KakaoSdk.init(
    nativeAppKey: kakaoNativeAppKey,
    javaScriptAppKey: kakaoJavaScriptKey,
  );

  final cameras = await availableCameras();
  if (cameras.isEmpty) {
    // 카메라가 없을 때의 처리
    throw Exception('No cameras available');
  }

  final cameraController = CameraController(
    cameras.first,
    ResolutionPreset.medium,
  );
  try {
    await cameraController.initialize();
  } catch (e) {
    // 초기화 실패 시의 처리
    print('Camera initialization error: $e');
  }

  runApp(
    ProviderScope(
      overrides: [
        cameraProvider.overrideWithValue(cameraController),
      ],
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
