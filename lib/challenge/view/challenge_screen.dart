import 'package:flick_frontend/common/const/colors.dart';
import 'package:flutter/material.dart';

class ChallengeScreen extends StatefulWidget {
  const ChallengeScreen({super.key});

  @override
  State<ChallengeScreen> createState() => _ChallengeScreenState();
}

class _ChallengeScreenState extends State<ChallengeScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          "이승창",
          style: TextStyle(
            fontSize: 30.0,
            color: PRIMARY_COLOR,
          ),
        ),
      ),
    );
  }
}
