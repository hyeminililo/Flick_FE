import 'package:flick_frontend/common/const/colors.dart';
import 'package:flutter/material.dart';

class NotRecognizePictureErrorScreen extends StatefulWidget {
  const NotRecognizePictureErrorScreen({super.key});

  @override
  State<NotRecognizePictureErrorScreen> createState() =>
      _NotRecognizePictureErrorScreenState();
}

class _NotRecognizePictureErrorScreenState
    extends State<NotRecognizePictureErrorScreen> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Image.asset("assets/images/Error_Image_camera.png",
                height: screenHeight * 0.20, width: screenWidth * 0.3),
            SizedBox(
              height: screenHeight * 0.01,
            ),
            const Text(
              "사진이 올바르게 찍히지\n않았아요, 다시 시도해주세요",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15.0,
                fontFamily: "Pretendard",
              ),
            ),
            SizedBox(
              height: screenHeight * 0.01,
            ),
            const Text(
              "인증하기 버튼을 눌러 다시 한 번 사진 촬영 해주세요",
              style: TextStyle(
                fontSize: 3.0,
                color: Colors.grey,
                fontFamily: "Pretendard",
              ),
            ),
            SizedBox(
              height: screenHeight * 0.35,
            ),
            Padding(
                padding: EdgeInsets.only(top: screenHeight * 0.05),
                child: Center(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: PRIMARY_COLOR,
                        padding: EdgeInsets.symmetric(
                          horizontal: screenWidth * 0.345,
                          vertical: screenHeight * 0.02,
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    child: Text(
                      '새로고침',
                      style: TextStyle(
                        fontSize: screenWidth * 0.04,
                      ),
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
