import 'package:flick_frontend/challenge/view/challenge_screen.dart';
import 'package:flick_frontend/home/view/home_screen.dart';
import 'package:flick_frontend/members/view/Agreement_screen.dart';
import 'package:flick_frontend/members/view/PurposeOfUsage_screen.dart';
import 'package:flick_frontend/members/view/login_screen.dart';
import 'package:flick_frontend/members/view/onBoarding_screen.dart';
import 'package:flick_frontend/members/view/success.dart';
import 'package:flick_frontend/rank/view/rank_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const OnboardingScreen(),
      routes: {
        '/login': (context) => const LoginPage(),
        '/rank': (context) => const RankScreen(),
        '/challenge': (context) => const ChallengeScreen(),
      },
    );
  }
}
