import 'package:flick_frontend/auth/view/communityAgreement_screen.dart';
import 'package:flick_frontend/auth/view/personalInfoAgreement_screen.dart';
import 'package:flick_frontend/auth/view/serviceAgreement_screen.dart';
import 'package:flick_frontend/members/view/purposeOfUsage_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flick_frontend/auth/view/login_screen.dart';
import 'package:flick_frontend/env.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'auth/view/onBoarding_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var kakaoNativeAppKey = Env.kakaoNativeAppKey;
  var kakaoJavaScriptKey = Env.kakaoJavaScriptKey;
  KakaoSdk.init(
      nativeAppKey: kakaoNativeAppKey, javaScriptAppKey: kakaoJavaScriptKey);

  final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: '/login',
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: '/purpose',
        builder: (context, state) => const PurposeOfUsageScreen(),
      ),
      GoRoute(
        path: '/service-agreement',
        builder: (context, state) => Serviceagreement(
            title: (state.extra as Map<String, dynamic>?)?['title'] ?? ''),
      ),
      GoRoute(
        path: '/personal-info-agreement',
        builder: (context, state) => PersonalInfoAgreement(
            title: (state.extra as Map<String, dynamic>?)?['title'] ?? ''),
      ),
      GoRoute(
        path: '/community-agreement',
        builder: (context, state) => CommunityAgreement(
            title: (state.extra as Map<String, dynamic>?)?['title'] ?? ''),
      ),
      GoRoute(
        path: '/onboarding',
        builder: (context, state) => const OnboardingScreen(),
      ),
    ],
  );

  runApp(
    ProviderScope(
      child: MaterialApp.router(
        routerDelegate: router.routerDelegate,
        routeInformationParser: router.routeInformationParser,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
      ),
    ),
  );
}
