import 'package:flick_frontend/common/const/colors.dart';
import 'package:flutter/material.dart';

class CaptureButtonWidget extends StatelessWidget {
  final Function onPressed;

  const CaptureButtonWidget({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: EdgeInsets.only(bottom: screenHeight * 0.03),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            backgroundColor: Colors.white,
            padding: EdgeInsets.symmetric(
              horizontal: screenWidth * 0.135,
              vertical: screenHeight * 0.023,
            ),
          ),
          onPressed: () => onPressed(),
          child: const Text(
            "인증하기",
            style: TextStyle(color: PRIMARY_COLOR),
          ),
        ),
      ),
    );
  }
}
