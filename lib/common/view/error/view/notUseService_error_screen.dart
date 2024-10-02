import 'package:flick_frontend/common/const/colors.dart';
import 'package:flutter/material.dart';

class NotUseServiceErrorScreen extends StatefulWidget {
  const NotUseServiceErrorScreen({super.key});

  @override
  State<NotUseServiceErrorScreen> createState() =>
      _NotUseServiceErrorScreenState();
}

class _NotUseServiceErrorScreenState extends State<NotUseServiceErrorScreen> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Image.asset("assets/images/Error_Image_!.png",
                height: screenHeight * 0.20, width: screenWidth * 0.3),
            SizedBox(
              height: screenHeight * 0.01,
            ),
            const Text(
              "서비스 이용에\n불편을 드려서 죄송합니다",
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
              "서비스 이용자가 많아 앱이 지연되고 있습니다.\n다시 한 번 시도해주시기 바랍니다",
              style: TextStyle(
                fontSize: 5.0,
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
