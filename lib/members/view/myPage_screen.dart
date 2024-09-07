import 'package:flick_frontend/common/const/colors.dart';
import 'package:flutter/material.dart';

class MypageScreen extends StatefulWidget {
  const MypageScreen({super.key});

  @override
  State<MypageScreen> createState() => _MypageScreenState();
}

class _MypageScreenState extends State<MypageScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          "이승창_MyPage",
          style: TextStyle(
            fontSize: 30.0,
            color: PRIMARY_COLOR,
          ),
        ),
      ),
    );
  }
}
