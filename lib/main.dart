// import 'package:flick_frontend/auth/view/agreement_screen.dart';
// import 'package:flick_frontend/auth/view/communityAgreement_screen.dart';
// import 'package:flick_frontend/auth/view/personalInfoAgreement_screen.dart';
// import 'package:flick_frontend/auth/view/serviceAgreement_screen.dart';
// import 'package:flick_frontend/challenge/view/challenge_screen.dart';
// import 'package:flick_frontend/challenge/view/myChallenge.dart';
// import 'package:flick_frontend/challenge/view/openChallenge.dart';
// import 'package:flick_frontend/members/view/purposeOfUsage_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import 'package:flick_frontend/auth/view/login_screen.dart';
// import 'package:flick_frontend/env.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
// import 'auth/view/onBoarding_screen.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   var kakaoNativeAppKey = Env.kakaoNativeAppKey;
//   var kakaoJavaScriptKey = Env.kakaoJavaScriptKey;
//   KakaoSdk.init(
//       nativeAppKey: kakaoNativeAppKey, javaScriptAppKey: kakaoJavaScriptKey);

//   runApp(
//     ProviderScope(
//       child: MaterialApp(
//         title: 'Flutter Demo',
//         theme: ThemeData(
//           colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//           useMaterial3: true,
//         ),
//         home: const ChallengeScreen(),
//       ),
//     ),
//   );
// }

import 'package:camera/camera.dart';
import 'package:flick_frontend/challenge/view/challenge_screen.dart';
import 'package:flick_frontend/challenge/view/myChallenge.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flick_frontend/auth/view/agreement_screen.dart';
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
  final cameraController = CameraController(
    cameras.first,
    ResolutionPreset.medium,
  );
  await cameraController.initialize();

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
