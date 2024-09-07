import 'package:flick_frontend/common/const/colors.dart';
import 'package:flutter/material.dart';

class EcologyScreen extends StatefulWidget {
  const EcologyScreen({super.key});

  @override
  State<EcologyScreen> createState() => _EcologyScreenState();
}

class _EcologyScreenState extends State<EcologyScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          "이승창_환경뉴스",
          style: TextStyle(
            fontSize: 30.0,
            color: PRIMARY_COLOR,
          ),
        ),
      ),
    );
  }
}
