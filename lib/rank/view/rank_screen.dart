import 'package:flick_frontend/common/const/colors.dart';
import 'package:flutter/material.dart';

class RankScreen extends StatefulWidget {
  const RankScreen({super.key});

  @override
  State<RankScreen> createState() => _RankScreenState();
}

class _RankScreenState extends State<RankScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          "이승창_Rank",
          style: TextStyle(
            fontSize: 30.0,
            color: PRIMARY_COLOR,
          ),
        ),
      ),
    );
  }
}
