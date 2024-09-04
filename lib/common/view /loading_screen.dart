import 'package:flutter/material.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  Widget build(BuildContext context) {
    // 나중에 상태관리를 하면서 height와 width를 한꺼번에 받는 클래스로 변경하기(생성자이용)
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
        child: Image.asset("assets/images/flick.png",
            height: screenHeight * 0.20, // 화면 높이의 20%
            width: screenWidth * 0.3),
      ),
    );
  }
}
